#define N 2  // 2 (resp. 3) - requires setting max_depth to 12000 (resp. 22000)
#define B 2

byte mutexE = 1;
byte mutexL = 1;
byte barrier = 0;
byte barrier2 = 0;

int c[N];  // array for counting cycles
byte enter=0;
byte leaving=0;

inline acquire(s) {
  skip;
end1:atomic {
    s>0;
    s--
  }
}

inline release(s) {
  s++
}

inline absolute(inp,outp) { // absolute value of inp placed in outp
  if
    :: inp>0 -> outp = inp
    :: else -> 
      outp = 0-inp;
  fi
}

active[N] proctype P() {
  byte i;
  byte j;
  byte x;
  byte k;
  byte z;
  byte b=B;
  byte n=N;

  for (i: 1..100 ) {
    // complete
    acquire(mutexE);
    enter=enter+1;
    if
      ::enter==B ->
      for(k:1..b){
        release(barrier)
      } 
      enter=0;
      :: else-> skip;
    fi
    release(mutexE);
    acquire(barrier);
    c[_pid]=c[_pid]+1;

    printf("%d reached at cycle %d\n",_pid, c[_pid]);
    atomic {
      // assertion here
      for(z:1..n){
        for(j:1..n){
          byte a=0;
          int inp=c[z-1]-c[j-1];
          absolute(inp,a);
          assert(a<=1)
        }
      }
    };

    printf("%d leaves at cycle %d\n",_pid, c[_pid]);

    // complete
    acquire(mutexL);
    leaving=leaving+1;
    if
      ::leaving==B -> 
      for(x:1..b){
        release(barrier2)
      } 
      leaving=0
      :: else-> skip;
    fi
    release(mutexL);
    acquire(barrier2);
  }
}