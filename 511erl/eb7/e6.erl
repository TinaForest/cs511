-module(e6).
-compile(export_all).
-compile(nowarn_export_all).


fibonacci(0)->
    0;
fibonacci(1)->
    1;
fibonacci(X)->
    fibonacci(X-2)+fibonacci(X-1).


fibonacciTR(X)->
    helper(X,0,1).
%0,1
%1,0
%1,1
%2,1
%3,2
%5,3 
helper(0,A,_)->
    A;
helper(X,Acc1,Acc2)->
    helper(X-1,Acc1+Acc2,Acc1).
