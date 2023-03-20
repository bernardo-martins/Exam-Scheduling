sl(1..2).

K{par(DAY,SL):sl(SL)}K:-slots(DAY,K).

:-par(DAY,SL),slots(DAY,K), SL>K.

1{assign(CHAIR, DAY,SL_N, NUMBER) : par(DAY, SL_N)} :- courseYear(CHAIR,YEAR), enrolled(CHAIR,NUMBER).

:- assign(C, D, SL,NUMBER), assign(C2, D, SL2,NUMBER2), overlap(C,C2,OV),OV>0,C!=C2.


1{assign(C,D,SL,N,R_N, CAP) : room(R_N, CAP)} :- assign(C,D,SL,N).
 

:- assign(C, D, SL,_, R_N, CAP), assign(C, D, SL1,_), SL != SL1.

:- assign(CHAIR, DAY, SL_N,NUMBER, R_N, CAP), later(CHAIR2, DAY2), DAY<=DAY2, CHAIR == CHAIR2.
:- assign(CHAIR, DAY , SL_N,NUMBER, R_N, CAP), earlier(CHAIR2, DAY2), DAY>=DAY2,CHAIR == CHAIR2.

:- assign(C, D, SL, N, R_N, CAP), assign(C2, D2, SL2, N2, R_N2, CAP2), courseYear(C, YEAR), courseYear(C2, YEAR),YEAR<=3, D+1 == D2.

capPerChair(C,S) :- S = #sum{CAP,R_N    : assign(C,_,_,_,R_N, CAP),room(R_N,CAP) },courseYear(C,_).
:- capPerChair(C,S), enrolled(C,M), S<M.

totalST(S,DAY,SL) :- S = #sum{ I : assign(CHAIR, DAY,SL,I, R_N, CAP)}, par(DAY,SL).
:- limit(X), totalST(S,DAY,SL) , S>X.

totalRoomCapacity(S) :- S = #sum{ CAP,N_R : assign(CHAIR, DAY, SL, N, N_R, CAP) },assign(CHAIR, DAY, SL, N).
totalConsecStudents(T) :- T = #sum{ TOTAL : overlap(CHAIR, CHAIR1, TOTAL) },  assign(CHAIR, DAY, _, _, _, _), assign(CHAIR1, DAY+1, _, _, _, _).
totalRooms(S) :- S = #count{ N_R : assign(CHAIR, DAY, SL, N, N_R, CAP) }.

#minimize { 3@1 : totalRooms(S) ; 2@1 : totalRoomCapacity(K); 1@1 : totalConsecStudents(T) }.
assign(C, D, SL) :- assign(C, D, SL, N, N_R, CP).

#show assign/3.
