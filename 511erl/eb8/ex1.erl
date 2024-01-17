-module(ex1).
-compile(export_all).
-compile(nowarn_export_all).

start(N)-> %% Spawns a counter and N turnstile clients
    C=spawn(?MODULE,counter_server,[0]),
    [spawn(?MODULE,turnstile,[C,50])||_<-lists:seq(1,N)] ,
    C.
%% State is the current value of the counter
counter_server(State)-> 
    receive
        {bump}->
            counter_server(State+1);
        {read,From}->
            From!{State},
            counter_server(State)
    end.
%% C-PID of the counter
%% N-the number of times the turnstile turns
turnstile(C,0)->
    C!{read,self()},
    receive
        {State}->
            io:format("~w~n",[State])
    end;
turnstile(C,N)->
    C!{bump},
    turnstile(C,N-1).

