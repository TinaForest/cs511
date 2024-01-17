-module(ex2a).
-compile(export_all).
-compile(nowarn_export_all).

start()->
    S=spawn(?MODULE,server,[[]]),
    spawn(?MODULE,client,[S]),
    ok.

client(S)-> 
    S!{start,self()},
    S!{add,"h",self()},
    S!{add,"e",self()},
    S!{add,"l",self()},
    S!{add,"l",self()},
    S!{add,"o",self()},
    S!{done,self()},
    receive
        {S,Str}->
            io:format("Done:~p~s~n",[self(),Str])
    end.

server(L)->
    receive
        {start,_From}->
            server([]);
        {add,Str,_From}->
            server(L++Str);
        {done,From}->
            From!{self(),L}
    end.

