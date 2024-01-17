-module(gg).
-compile(export_all).
-compile(nowarn_export_all).

start()->
	S=spawn(?MODULE,server_loop,[]),
	[spawn(?MODULE,client_loop,[S])||_<-lists:seq(1,100)].

server_loop()->
	receive
		{From,start}->
			S=spawn(?MODULE,servlet_loop,[rand:uniform(100),From]),
			From!{ok,S},
			server_loop()
	end.
client_loop(S)->
	S!{self(),start},
	receive
		{ok,ServletPID}->
            client_loop(ServletPID,rand:uniform(100),0)
	end.

servlet_loop(Ans,Cl_PID)->
    %io:format("~p~n",[Ans]),
	receive
		{Cl_PID,guess,N} when Ans==N ->
			Cl_PID!{gotIt};
		{Cl_PID,guess,N} when Ans/=N->
			Cl_PID!{tryAgain},
            servlet_loop(Ans,Cl_PID)
    end.
client_loop(S,N,C)->
    %io:format("~w~n",[N]),
	S!{self(),guess,N},
	receive
		{gotIt}->
			io:format("~p Got it in ~p tries\n",[self(),C]),
			ok;
		{tryAgain}->
			client_loop(S,rand:uniform(100),C+1)
    end.