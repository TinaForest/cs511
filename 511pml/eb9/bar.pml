byte mutex=1;
byte ticket=0;
byte p=0;
byte j=0;

inline acquire(s){
    skip;
end1:  atomic{
        s>0;
        s--
    }
}
inline release(s){
    s++
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
    atomic{
        release(ticket);
        p++;
    }
    assert(p>=2*j)
}