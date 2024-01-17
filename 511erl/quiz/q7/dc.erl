-module(dc).
-compile(nowarn_export_all ).
-compile(export_all ).
%%  Kailie Jett and Yunfei Tang
dryCleanerLoop(Clean ,Dirty) ->%% Clean , Dirty are counters
    receive
        {dropOffOverall}->
            %io:format("C:~w D:~w~n",[Clean,Dirty]),
            dryCleanerLoop(Clean,Dirty+1);
        {From,pickUpOverall} when Clean>0->
            %io:format("C:~w D:~w~n",[Clean,Dirty]),
            From!{ok},
            dryCleanerLoop(Clean-1,Dirty);
        {From,dryCleanItem} when Dirty>0->
            %io:format("C:~w D:~w~n",[Clean,Dirty]),
            From!{ok},
            dryCleanerLoop(Clean+1,Dirty-1)
    end.
employee(DC) ->% drop off overall , then pick up a clean one (if none
% is available , wait), and end
    DC!{dropOffOverall},
    %io:format("Dirty+1"),
    DC!{self(),pickUpOverall},
    receive
        {ok}->
            %io:format("Clean-1~n")
            ok
    end.
    %employee(DC).

dryCleanMachine(DC) ->% dry clean item (if none are available , wait),
% then sleep for a while (timer:sleep (1000)) and repeat
    DC!{self(),dryCleanItem},
    receive
        {ok}->
            %io:format("dry clean~n")
            ok
    end,
    timer:sleep(1000),
    dryCleanMachine(DC).

start(E,M) ->% E= no. of employees , M= no. of machines
    DC=spawn(?MODULE ,dryCleanerLoop ,[0,0]),
    [spawn(?MODULE ,employee ,[DC]) || _ <- lists:seq(1,E) ],
    [spawn(?MODULE ,dryCleanMachine ,[DC]) || _ <- lists:seq(1,M) ].