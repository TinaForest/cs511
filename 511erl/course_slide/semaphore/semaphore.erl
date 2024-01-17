-module(semaphore).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    S = make_semaphore(0),
    spawn(?MODULE, p1, [S]),
    spawn(?MODULE, p2, [S]),
    ok.
p1(S) ->
    io:format("a~n"),
    release(S),
    io:format("c~n"),
    release(S).
p2(S) -> % acquire is inlined
    acquire(S),
    io:format("b~n"),
    acquire(S),
    io:format("d~n").

release(S) -> % could be included in semaphore module
    S!{release}.

acquire(S) ->
    R = make_ref(),
    S!{self(),R,acquire},
    receive
        {S,R,ok} ->
            ok
    end.

make_semaphore(Permits) ->
    spawn (?MODULE, semaphore, [Permits]).
semaphore(0) ->
    receive
        {release} ->
            semaphore(1)
    end;
semaphore(P) when P>0 ->
    receive
        {release} ->
            semaphore(P+1);
        {From, Ref, acquire} ->
            From!{self(),Ref,ok},
            semaphore(P-1)
    end.