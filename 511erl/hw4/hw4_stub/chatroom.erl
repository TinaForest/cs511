-module(chatroom).

-include_lib("./defs.hrl").

-export([start_chatroom/1]).

-spec start_chatroom(_ChatName) -> _.
-spec loop(_State) -> _.
-spec do_register(_State, _Ref, _ClientPID, _ClientNick) -> _NewState.
-spec do_unregister(_State, _ClientPID) -> _NewState.
-spec do_update_nick(_State, _ClientPID, _NewNick) -> _NewState.
-spec do_propegate_message(_State, _Ref, _ClientPID, _Message) -> _NewState.

start_chatroom(ChatName) ->
    loop(#chat_st{name = ChatName,
		  registrations = maps:new(), history = []}),
    ok.

loop(State) ->
    NewState =
	receive
	    %% Server tells this chatroom to register a client
	    {_ServerPID, Ref, register, ClientPID, ClientNick} ->
		do_register(State, Ref, ClientPID, ClientNick);
	    %% Server tells this chatroom to unregister a client
	    {_ServerPID, _Ref, unregister, ClientPID} ->
		do_unregister(State, ClientPID);
	    %% Server tells this chatroom to update the nickname for a certain client
	    {_ServerPID, _Ref, update_nick, ClientPID, NewNick} ->
		do_update_nick(State, ClientPID, NewNick);
	    %% Client sends a new message to the chatroom, and the chatroom must
	    %% propegate to other registered clients
	    {ClientPID, Ref, message, Message} ->
		do_propegate_message(State, Ref, ClientPID, Message);
	    {TEST_PID, get_state} ->
		TEST_PID!{get_state, State},
		loop(State)
end,
    loop(NewState).

%% This function should register a new client to this chatroom
do_register(State, Ref, ClientPID, ClientNick) ->
	ClientPID!{self(), Ref, connect, State#chat_st.history},
	NewState=State#chat_st{
		name=State#chat_st.name,
		registrations=maps:put(ClientPID,ClientNick,State#chat_st.registrations),
		history=State#chat_st.history
	},
    NewState.

%% This function should unregister a client from this chatroom
do_unregister(State, ClientPID) ->
	NewState=#chat_st{
		name = State#chat_st.name,
		registrations = maps:remove(ClientPID, State#chat_st.registrations),
		history = State#chat_st.history
	},
	NewState.

%% This function should update the nickname of specified client.
do_update_nick(State, ClientPID, NewNick) ->
	NewState=#chat_st{
		name = State#chat_st.name,
		registrations = maps:put(ClientPID, NewNick, State#chat_st.registrations),
		history = State#chat_st.history
	},
	NewState.

%% This function should update all clients in chatroom with new message
%% (read assignment specs for details)
do_propegate_message(State, Ref, ClientPID, Message) ->
	ClientPID!{self(), Ref, ack_msg},
	Nick = maps:get(ClientPID, State#chat_st.registrations),
	Pred = fun(K,_V) -> K =/= ClientPID end,
	Clients = maps:keys(maps:filter(Pred,State#chat_st.registrations)),
	Update = fun(C) -> C!{request, self(), Ref, {incoming_msg, Nick, State#chat_st.name, Message}}
			 end,
	lists:foreach(Update, Clients),
	NewState=#chat_st{
		name = State#chat_st.name,
		registrations = State#chat_st.registrations,
		history = State#chat_st.history ++ [{Nick, Message}]
	},
	NewState.
