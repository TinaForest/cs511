-module(fs).
-compile(export_all).
-compile(nowarn_export_all).

start()->
	spawn(?MODULE,fs,[0,fun(X)->fact(X) end]).
fact(0)->
	1;
fact(N) when N>0->
	N*fact(N-1).
fs(C,F)->
	receive
		{From,Msg,Ref}->
            try F(Msg) of
                R->
                    From!{R,ok,Ref},
                    fs(C+1,F)
            catch
                throw:_-> From!{error,Ref},
                        fs(C,F);
                error:_-> From!{error,Ref},
                        fs(C,F);
                exit:_-> From!{error,Ref},
                        fs(C,F)
            end;
		{update,G}->
			fs(0,G);
        {From,read}->
            From!{C},
            fs(C,F);
        {stop}->
            ok
	end.