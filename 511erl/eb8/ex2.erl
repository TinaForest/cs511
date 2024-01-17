-module(ex2).
-compile(export_all).
-compile(nowarn_export_all).

start()->
    S=spawn(?MODULE,server,[]),
    [spawn(?MODULE,client,[S])||_<-lists:seq(1,10)],
    ok.

client(S)-> 
    S!{start,self()},
    receive
        {ok,Ser}->
            Ser!{add,"h",self()},
            Ser!{add,"e",self()},
            Ser!{add,"l",self()},
            Ser!{add,"l",self()},
            Ser!{add,"o",self()},
            Ser!{done,self()},
            receive
                {Ser,Str}->
                    io:format("Done:~p~s~n",[self(),Str])
            end
    end.

server()->
    receive
        {start,From}->
            T=spawn(?MODULE,servlet,[[]]),
            From!{ok,T},
            server()
    end.
servlet(L)->
    receive
        {add,Str,_From}->
            servlet(L++Str);
        {done,From}->
            From!{self(),L}
    end.   
