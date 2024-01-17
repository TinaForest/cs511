byte lock=1;
byte wait_set=0;
byte delta=0;
byte p=0;
byte j=0;

// class Bar {
//   int delta=0
  
//   synchronized void Jets() {
//    while (delta<2) {
//      wait()
//    }
//    delta=delta-2
//   }

//   synchronized void Patriots() {
//    delta++
//    notify()
//   }
// }

inline acquire(s) {
 skip;
end1: atomic {
  s>0;
  s--
 }
}

inline release(s) {
 s++
}

inline enter_jets() {
 acquire(lock);
 do
  :: delta<2 ->
    release(lock);
    acquire(wait_set);
    acquire(lock)
  :: else -> break
 od;
 delta=delta-2;
 release(lock)
}

inline enter_patriots() {
 acquire(lock);
 delta++;
 release(wait_set); // notify()
 p++;
 release(lock)
}

active[3] proctype Jets() {
 enter_jets();
 j++;
 assert (p>=2*j) 
}

active[6] proctype Patriots() {
 enter_patriots();
 assert (p>=2*j) 
}