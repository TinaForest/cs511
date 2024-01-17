byte mutex=1;
byte ticket=0;
byte p=0;
byte j=0;

incline acquire(s){
    atomic{
        s>0;
        s--
    }
}
incline release(s){
    s--
}
active[10] proctype Jets(){
    acquire(mutex);
    acquire(ticket);
    acquire(ticket);
    release(mutex);
    j++;
    assert(p>=2*j)
}

active[10] proctype Patriots(){
    release(ticket);
    p++;
    assert(p>=2*j)
}