#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - crlea.pml:39 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_4_1_i);
		((P1 *)_this)->_4_1_i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)_this)->_4_1_i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - crlea.pml:40 - [((i<5))] (6:0:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)((P1 *)_this)->_4_1_i)<5)))
			continue;
		/* merge: printf('Initilizing %d\\n',i)(6, 3, 6) */
		reached[1][3] = 1;
		Printf("Initilizing %d\n", ((int)((P1 *)_this)->_4_1_i));
		/* merge: id = i(6, 4, 6) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->_4_1_id);
		((P1 *)_this)->_4_1_id = ((int)((P1 *)_this)->_4_1_i);
#ifdef VAR_RANGES
		logval(":init::id", ((int)((P1 *)_this)->_4_1_id));
#endif
		;
		/* merge: next_id = (((i-1)+5)%5)(6, 5, 6) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)_this)->_4_1_next_id);
		((P1 *)_this)->_4_1_next_id = (((((int)((P1 *)_this)->_4_1_i)-1)+5)%5);
#ifdef VAR_RANGES
		logval(":init::next_id", ((int)((P1 *)_this)->_4_1_next_id));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 5: // STATE 6 - crlea.pml:44 - [(run nnode(id,next_id))] (0:0:2 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 0, ((int)((P1 *)_this)->_4_1_id), ((int)((P1 *)_this)->_4_1_next_id))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_1_id */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->_4_1_id;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_4_1_id = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_1_next_id */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->_4_1_next_id;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_4_1_next_id = 0;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 7 - crlea.pml:45 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_4_1_i);
		((P1 *)_this)->_4_1_i = (((int)((P1 *)_this)->_4_1_i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)_this)->_4_1_i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 8 - crlea.pml:46 - [((i>=5))] (12:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!((((int)((P1 *)_this)->_4_1_i)>=5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_1_i */  (trpt+1)->bup.oval = ((P1 *)_this)->_4_1_i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_4_1_i = 0;
		/* merge: goto :b1(0, 9, 12) */
		reached[1][9] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 8: // STATE 14 - crlea.pml:51 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC nnode */
	case 9: // STATE 1 - crlea.pml:9 - [ch[next_id]!electe,id] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->id)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ], 0, 2, ((int)((P0 *)_this)->id), 2);
		_m = 2; goto P999; /* 0 */
	case 10: // STATE 2 - crlea.pml:11 - [ch[id]?electe,eId] (0:0:1 - 1)
		reached[0][2] = 1;
		if (q_len(now.ch[ Index(((int)((P0 *)_this)->id), 5) ]) == 0) continue;

		XX=1;
		if (2 != qrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->eId);
		;
		((P0 *)_this)->eId = qrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:eId", ((int)((P0 *)_this)->eId));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ch[ Index(((int)((P0 *)_this)->id), 5) ]);
			sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P0 *)_this)->eId)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 11: // STATE 3 - crlea.pml:12 - [printf('%d received: %d electe\\n',id,eId)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		Printf("%d received: %d electe\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->eId));
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - crlea.pml:14 - [((eId>id))] (6:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((int)((P0 *)_this)->eId)>((int)((P0 *)_this)->id))))
			continue;
		/* merge: printf('%d is sending {electe %d} to %d\\n',id,eId,next_id)(0, 5, 6) */
		reached[0][5] = 1;
		Printf("%d is sending {electe %d} to %d\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->eId), ((int)((P0 *)_this)->next_id));
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 6 - crlea.pml:16 - [ch[next_id]!electe,eId] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->eId)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ], 0, 2, ((int)((P0 *)_this)->eId), 2);
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 7 - crlea.pml:17 - [((eId==id))] (9:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)((P0 *)_this)->eId)==((int)((P0 *)_this)->id))))
			continue;
		/* merge: printf('find leader, %d send to the ring\\n',id)(0, 8, 9) */
		reached[0][8] = 1;
		Printf("find leader, %d send to the ring\n", ((int)((P0 *)_this)->id));
		_m = 3; goto P999; /* 1 */
	case 15: // STATE 9 - crlea.pml:19 - [ch[next_id]!leader,eId] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->eId)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ], 0, 1, ((int)((P0 *)_this)->eId), 2);
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 13 - crlea.pml:22 - [ch[id]?leader,lId] (0:0:1 - 1)
		reached[0][13] = 1;
		if (q_len(now.ch[ Index(((int)((P0 *)_this)->id), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->lId);
		;
		((P0 *)_this)->lId = qrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:lId", ((int)((P0 *)_this)->lId));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ch[ Index(((int)((P0 *)_this)->id), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P0 *)_this)->lId)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 17: // STATE 14 - crlea.pml:23 - [leader_id = lId] (0:21:2 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->leader_id);
		((P0 *)_this)->leader_id = ((int)((P0 *)_this)->lId);
#ifdef VAR_RANGES
		logval("nnode:leader_id", ((int)((P0 *)_this)->leader_id));
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: leader_id */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->leader_id = 0;
		/* merge: printf('%d received: %d is leader\\n',id,lId)(21, 15, 21) */
		reached[0][15] = 1;
		Printf("%d received: %d is leader\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->lId));
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 16 - crlea.pml:26 - [((id!=lId))] (18:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!((((int)((P0 *)_this)->id)!=((int)((P0 *)_this)->lId))))
			continue;
		/* merge: printf('MSC: LOST\\n')(0, 17, 18) */
		reached[0][17] = 1;
		Printf("MSC: LOST\n");
		_m = 3; goto P999; /* 1 */
	case 19: // STATE 18 - crlea.pml:28 - [ch[next_id]!leader,lId] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->lId)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ], 0, 1, ((int)((P0 *)_this)->lId), 2);
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 19 - crlea.pml:29 - [((id==lId))] (23:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)((P0 *)_this)->id)==((int)((P0 *)_this)->lId))))
			continue;
		/* merge: printf('MSC: LEADER%d\\n',lId)(0, 20, 23) */
		reached[0][20] = 1;
		Printf("MSC: LEADER%d\n", ((int)((P0 *)_this)->lId));
		/* merge: .(goto)(0, 22, 23) */
		reached[0][22] = 1;
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: // STATE 26 - crlea.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

