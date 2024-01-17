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
	case 3: // STATE 1 - ex.pml:18 - [(run P())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - ex.pml:19 - [(run Q())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - ex.pml:21 - [((_nr_pr==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now._nr_pr)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - ex.pml:22 - [assert((n>2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		spin_assert((now.n>2), "(n>2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - ex.pml:23 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Q */
	case 8: // STATE 1 - ex.pml:11 - [temp = n] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->temp;
		((P1 *)_this)->temp = now.n;
#ifdef VAR_RANGES
		logval("Q:temp", ((P1 *)_this)->temp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - ex.pml:12 - [n = (temp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = (((P1 *)_this)->temp+1);
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 3 - ex.pml:13 - [printf('Q %d\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		Printf("Q %d\n", ((int)((P1 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 4 - ex.pml:14 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 12: // STATE 1 - ex.pml:5 - [temp = n] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->temp;
		((P0 *)_this)->temp = now.n;
#ifdef VAR_RANGES
		logval("P:temp", ((P0 *)_this)->temp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 2 - ex.pml:6 - [n = (temp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = (((P0 *)_this)->temp+1);
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 3 - ex.pml:7 - [printf('P %d\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		Printf("P %d\n", ((int)((P0 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 4 - ex.pml:8 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
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

