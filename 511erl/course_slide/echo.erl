-module(echo).
-export([start/0]).

echo() ->
receive
    {From, Msg} ->
        From ! {Msg},
        echo();
    stop -> true
end.

start () ->
    Pid = spawn(fun echo/0), % Returns pid of a new process
    % started by the application of echo /0 to [ ]
    Token = "Hello Server!" ,
    % Sending tokens to the server
    Pid ! {self(), Token} ,
    io:format("Sent ~s~n", [Token]),
    receive
        {Msg} ->
            io:format("Received ~s~n", [Msg])
    end,
    Pid ! stop.
    % Stop server