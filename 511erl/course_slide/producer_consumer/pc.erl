-module(pc).
-compile(export_all).
-compile(nowarn_export_all).

start(P,C,N)->
    B=spawn(?MODULE,buffer,[N,0,0,0]),
    [spawn(?MODULE,producer,[B])||_<-lists:seq(1,P)],
    [spawn(?MODULE,consumer,[B])||_<-lists:seq(1,C)].

%% buffer(N,Oc,PSP,CSC)
%% Oc-Occupied slot
%% PSP-the number of producers starting producing
%% CSC-the number of consumers starting consuming
buffer(N,Oc,PSP,CSC)->
    receive
        {From,start_produce} when Oc+PSP<N->
            From!{ok},
            buffer(N,Oc,PSP+1,CSC);
        {_From,stop_producing}->
            buffer(N,Oc+1,PSP-1,CSC);
        {From,start_consume} when Oc-CSC>0->
            From!{ok},
            buffer(N,Oc,PSP,CSC+1);
        {_From,stop_consuming}->
            buffer(N,Oc-1,PSP,CSC-1)
    end.

producer(B)->
    B!{self(),start_produce},
    receive
        {ok}->
            io:format("produce~n")
    end,
    B!{self(),stop_producing}.

consumer(B)->
    B!{self(),start_consume},
    receive
        {ok}->
            io:format("consume~n")
    end,
    B!{self(),stop_consuming}.