/* Attempt III to solve the MEP problem in Promela */
/* Example of use of progress labels as a means to detect non-progress cycles */
/* 15 Nov 2023 */

bool wantP=false;
bool wantQ=false;

active proctype P() {
  do
    :: wantP=true;
       // await (c) = while (!c) {}
       do
	 :: !wantQ -> break
	 :: else -> skip
       od;
progress1:
       wantP=false;
  od
}

active proctype Q() {
  do
    :: wantQ=true;
       // await (c) = while (!c) {}
       do
	 :: !wantP -> break
	 :: else -> skip
       od;
progress2:
       wantQ=false;
  od
}
