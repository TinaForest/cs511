byte finished = 0;
byte n = 0;

active [2] proctype P () {
    byte i = 1;
    byte temp;
    for ( i :1..10) {
        temp = n;
        n = temp + 1
    }
    finished ++; /* Process terminates */
}

active proctype Finish () {
    finished == 2; /* Wait for termination */
    printf ( " n = %d \ n " , n );
    assert ( n >= 2); /* Assert can ’ t be 2 */
}