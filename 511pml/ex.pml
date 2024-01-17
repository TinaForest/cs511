int n=0;

proctype P(){
    int temp;
    temp=n;
    n=temp+1;
    printf("P %d\n",_pid)
}
proctype Q(){
    int temp;
    temp=n;
    n=temp+1;
    printf("Q %d\n",_pid)
}

init{
    atomic{
        run P();
        run Q()
    }
    _nr_pr==1;
    assert (n>2)
}