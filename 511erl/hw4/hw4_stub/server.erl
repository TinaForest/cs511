-module(server).

-export([start_server/0]).

-include_lib("./defs.hrl").

-spec start_server() -> _.
-spec loop(_State) -> _.
-spec do_join(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_leave(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_new_nick(_State, _Ref, _ClientPID, _NewNick) -> _.
-spec do_client_quit(_State, _Ref, _ClientPID) -> _NewState.

start_server() ->
    catch(unregister(server)),
    register(server, self()),
    case whereis(testsuite) of
	undefined -> ok;
	TestSuitePID -> TestSuitePID!{server_up, self()}
    end,
    loop(
      #serv_st{
	 nicks = maps:new(), %% nickname map. client_pid => "nickname"
	 registrations = maps:new(), %% registration map. "chat_name" => [client_pids]
	 chatrooms = maps:new() %% chatroom map. "chat_name" => chat_pid
	}
     ).

loop(State) ->
    receive 
	%% initial connection
	{ClientPID, connect, ClientNick} ->
	    NewState =
		#serv_st{
		   nicks = maps:put(ClientPID, ClientNick, State#serv_st.nicks),
		   registrations = State#serv_st.registrations,
		   chatrooms = State#serv_st.chatrooms
		  },
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, join, ChatName} ->
	    NewState = do_join(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, leave, ChatName} ->
	    NewState = do_leave(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to register a new nickname
	{ClientPID, Ref, nick, NewNick} ->
	    NewState = do_new_nick(State, Ref, ClientPID, NewNick),
	    loop(NewState);
	%% client requests to quit
	{ClientPID, Ref, quit} ->
	    NewState = do_client_quit(State, Ref, ClientPID),
	    loop(NewState);
	{TEST_PID, get_state} ->
	    TEST_PID!{get_state, State},
	    loop(State)
    end.

%% executes join protocol from server perspective
do_join(ChatName, ClientPID, Ref, State) ->
	case maps:find(ChatName,State#serv_st.chatrooms) of
		{ok,Value} -> ChatPid=Value;
		error -> ChatPid=spawn(chatroom,start_chatroom,[ChatName])
	end,
	ClientNick=maps:get(ClientPID,State#serv_st.nicks),
	ChatPid!{self(), Ref, register, ClientPID, ClientNick},
	case maps:find(ChatName,State#serv_st.registrations) of
		{ok,L_old}-> L=L_old++[ClientPID];
		error->L=[ClientPID]
	end,
    NewState=#serv_st{
		nicks=State#serv_st.nicks,
		registrations=maps:put(ChatName,L,State#serv_st.registrations),
		chatrooms=maps:put(ChatName,ChatPid,State#serv_st.chatrooms)
	},
	NewState.

%% executes leave protocol from server perspective
do_leave(ChatName, ClientPID, Ref, State) ->
	ChatPID = maps:get(ChatName,State#serv_st.chatrooms),
	% registrations: map(chatroom names->lists of clientPids inside)
	L_old = maps:get(ChatName,State#serv_st.registrations),
	Pred = fun(C) -> C=/=ClientPID end,
	R_new = maps:put(ChatName,lists:filter(Pred,L_old),State#serv_st.registrations),
	ChatPID!{self(), Ref, unregister, ClientPID},
	ClientPID!{self(), Ref, ack_leave},
	NewState=#serv_st{
			nicks = State#serv_st.nicks,
			registrations = R_new,
			chatrooms = State#serv_st.chatrooms
	},
	NewState.

%% executes new nickname protocol from server perspective
do_new_nick(State, Ref, ClientPID, NewNick) ->
	case lists:member(NewNick, maps:values(State#serv_st.nicks)) of
		true ->
			ClientPID!{self(), Ref, err_nick_used},
			State;
		false ->
			Pred = fun(_K,V) -> lists:member(ClientPID,V) end,
			ChatroomsIn = maps:filter(Pred, State#serv_st.registrations),
			Update = fun(Key) -> PID = maps:get(Key,State#serv_st.chatrooms), 
							PID!{self(), Ref, update_nick, ClientPID, NewNick} 
							end,
			lists:foreach(Update, maps:keys(ChatroomsIn)),
			NewNicks = maps:put(ClientPID,NewNick,State#serv_st.nicks),
			ClientPID!{self(), Ref, ok_nick},
			NewState=#serv_st{
				nicks = NewNicks,
				registrations = State#serv_st.registrations,
				chatrooms = State#serv_st.chatrooms
			},
			NewState
	end.

%% executes client quit protocol from server perspective
do_client_quit(State, Ref, ClientPID) ->
	% Tell each chatroom to which the client is registered that the client is leaving
	Pred = fun(_K,V) -> lists:member(ClientPID,V) end,
	ChatroomsIn = maps:filter(Pred, State#serv_st.registrations),
	Update = fun(Key) -> PID = maps:get(Key,State#serv_st.chatrooms), 
					PID!{self(), Ref, unregister, ClientPID}
				end,
	lists:foreach(Update, maps:keys(ChatroomsIn)),
	% Remove client from the server’s copy of all chat registrations
	R_new = maps:map(fun(_,V) ->
				case lists:member(ClientPID,V) of
					true -> lists:delete(ClientPID,V);
					_ -> V
				end
			end,State#serv_st.registrations),
	ClientPID!{self(), Ref, ack_quit},
	NewState=#serv_st{
			nicks = maps:remove(ClientPID,State#serv_st.nicks),
			registrations = R_new,
			chatrooms = State#serv_st.chatrooms
	},
	NewState.