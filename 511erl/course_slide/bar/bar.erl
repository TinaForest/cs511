-module(bar).
-compile(export_all).
-compile(nowarn_export_all).

start(P,J) ->
    S=spawn(?MODULE,server,[0,false]),
    [spawn(?MODULE,patriots,[S])||_<-lists:seq(1,P)],
    [spawn(?MODULE,jets,[S])||_<-lists:seq(1,J)],
    spawn(?MODULE,timer_loop,[S]).

timer_loop(S)->
    timer:sleep(5000),
    S!{itGotLate}.
patriots(S)->
    S!{patriots}.
jets(S)->
    S!{self(),jets},
    receive
        {ok}->
            ok
    end.

flush_and_notify()->
    receive
        {From,jets}->
            From!{ok},
            flush_and_notify()
    after 0->
        ok
    end.
server(Delta,false)->
    receive
        {patriots}->
            server(Delta+1,false);
        {From,jets} when Delta>1->
            From!{ok},
            server(Delta-2,false);
        {itGotLate}->
            % flush mailbox notifying all the jets fans
            flush_and_notify(),
            % have server transition to new state reflecting that it is late
            server(Delta,true)
    end;
server(Delta,true)->
    receive
        {patriots}->
            server(Delta+1,true);
        {From,jets}->
            From!{ok},
            server(Delta-2,true)
    end.
