-module(ex5).
-compile(export_all).
-compile(nowarn_export_all).

start()->
    Timer=spawn(?MODULE,timer,[100,[]]),
    register(pid1,spawn(?MODULE,r,[Timer,pid1])),
    register(pid2,spawn(?MODULE,r,[Timer,pid2])),
    register(pid3,spawn(?MODULE,r,[Timer,pid3])),
    register(pid4,spawn(?MODULE,r,[Timer,pid4])).

timer(Freq,L)->
    receive
        R->
            timer(Freq,L++[R])
    after 1000->
        t(Freq,L)
    end.
t(Freq,L)->
    timer:sleep(Freq),
    [Pid!{tick}||Pid<-L],
    t(Freq,L).

r(Timer,R)->
    Timer!R,
    r().
r()->
    receive
        {tick}->
            r()
    end.