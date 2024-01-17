-module(barrier).
-compile(export_all).
-compile(nowarn_export_all).

mk_barrier(N) ->
    spawn(?MODULE,coord,[N,N,[]]).

%% N: size of barrier
%% M: number of processes that have yet to reach the barrier(还没)
%% L: list of PIDs of those threads that have already reached the barrier
coord(N,0,L) ->
    [Pid!ok||Pid<-L],
    coord(N,N,[]);
coord(N,M,L) when M>0 ->
    receive
        Pid ->
            coord(N,M-1,[Pid|L])
    end.

reached(B) ->
    B!self(),
    receive 
        ok ->
            ok
    end.


