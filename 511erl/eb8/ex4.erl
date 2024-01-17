-module(ex4).
-compile(export_all).
-compile(nowarn_export_all).

start()->
    spawn(?MODULE,timer,[100,[spawn(?MODULE,r,[])||_<-lists:seq(1,4)]]).

timer(Freq,L)->
    timer:sleep(Freq),
    [Pid!{tick}||Pid<-L],
    timer(Freq,L).
r()->
    receive
        {tick}->
            r()
    end.