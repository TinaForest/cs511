-module(basic).
-compile(export_all).
-compile(nowarn_export_all).

mult(X,Y)->
    X*Y.

double(X)->
    X*1.0.

distance(T1,T2)->
    {X1,Y1}=T1,
    {X2,Y2}=T2,
    math:pow((X2-X1),2)+math:pow((Y2-Y1),2).

my_and(B1,B2)->
    if 
        B1 -> 
            if B2-> 
                true; 
            true->
                false
            end;
        true->
            false
        end.

my_or(B1,B2)->
    if B1 -> 
            true;
    true->
        if B2 ->                true;
        true->
            false
        end
    end.

my_not(B)->
    if B->
        false;
    true->
        true
    end.