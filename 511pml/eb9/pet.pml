
byte last = 1;
bool wantP = false;
bool wantQ = false;
byte cs=0;

proctype P() {
    do
     :: wantP = true;
        last = 1;
        do
         :: wantQ == false || last == 2 -> break;
            else
        od;
        cs++;
        assert(cs==1);
        cs--;
        wantP = false;
    od;
}

proctype Q() {
    do
     :: wantQ = true;
        last = 2;
        do
         :: wantP == false || last == 1 -> break;
            else
        od;
        cs++;
        assert(cs==1);
        cs--;
        wantQ = false;
    od;
}

init {
    atomic {
        run P();
        run Q();
    }
}