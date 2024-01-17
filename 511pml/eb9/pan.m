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

		 /* CLAIM ltl_0 */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!(csq))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !(((int)now.csq))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - _spin_nvr.tmp:4 - [(!(csp))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][3] = 1;
		if (!( !(((int)now.csp))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 10 - _spin_nvr.tmp:9 - [(!(csq))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][10] = 1;
		if (!( !(((int)now.csq))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 15 - _spin_nvr.tmp:13 - [(!(csp))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][15] = 1;
		if (!( !(((int)now.csp))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 20 - _spin_nvr.tmp:15 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported20 = 0;
			if (verbose && !reported20)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported20 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported20 = 0;
			if (verbose && !reported20)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported20 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC q */
	case 8: // STATE 1 - dekker.pml:32 - [wantq = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.wantq);
		now.wantq = 1;
#ifdef VAR_RANGES
		logval("wantq", ((int)now.wantq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - dekker.pml:34 - [(!(wantp))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!( !(((int)now.wantp))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 5 - dekker.pml:37 - [((turn==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)now.turn)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 6 - dekker.pml:38 - [((turn==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!((((int)now.turn)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 7 - dekker.pml:39 - [wantq = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.wantq);
		now.wantq = 0;
#ifdef VAR_RANGES
		logval("wantq", ((int)now.wantq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 8 - dekker.pml:40 - [((turn==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!((((int)now.turn)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 9 - dekker.pml:41 - [wantq = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.oval = ((int)now.wantq);
		now.wantq = 1;
#ifdef VAR_RANGES
		logval("wantq", ((int)now.wantq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 15 - dekker.pml:44 - [csq = 1] (0:0:1 - 3)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((int)now.csq);
		now.csq = 1;
#ifdef VAR_RANGES
		logval("csq", ((int)now.csq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 16 - dekker.pml:45 - [assert(!((csp&&csq)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		spin_assert( !((((int)now.csp)&&((int)now.csq))), " !((csp&&csq))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 17 - dekker.pml:46 - [csq = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.csq);
		now.csq = 0;
#ifdef VAR_RANGES
		logval("csq", ((int)now.csq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 18 - dekker.pml:47 - [wantq = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		(trpt+1)->bup.oval = ((int)now.wantq);
		now.wantq = 0;
#ifdef VAR_RANGES
		logval("wantq", ((int)now.wantq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 19 - dekker.pml:48 - [turn = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 23 - dekker.pml:50 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC p */
	case 21: // STATE 1 - dekker.pml:10 - [wantp = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.wantp);
		now.wantp = 1;
#ifdef VAR_RANGES
		logval("wantp", ((int)now.wantp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 2 - dekker.pml:12 - [(!(wantq))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!( !(((int)now.wantq))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 5 - dekker.pml:15 - [((turn==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)now.turn)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 6 - dekker.pml:16 - [((turn==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!((((int)now.turn)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 7 - dekker.pml:17 - [wantp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.wantp);
		now.wantp = 0;
#ifdef VAR_RANGES
		logval("wantp", ((int)now.wantp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 8 - dekker.pml:18 - [((turn==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)now.turn)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 9 - dekker.pml:19 - [wantp = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.wantp);
		now.wantp = 1;
#ifdef VAR_RANGES
		logval("wantp", ((int)now.wantp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 15 - dekker.pml:22 - [csp = 1] (0:0:1 - 3)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.csp);
		now.csp = 1;
#ifdef VAR_RANGES
		logval("csp", ((int)now.csp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 16 - dekker.pml:23 - [assert(!((csp&&csq)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		spin_assert( !((((int)now.csp)&&((int)now.csq))), " !((csp&&csq))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 17 - dekker.pml:24 - [csp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)now.csp);
		now.csp = 0;
#ifdef VAR_RANGES
		logval("csp", ((int)now.csp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 18 - dekker.pml:25 - [wantp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)now.wantp);
		now.wantp = 0;
#ifdef VAR_RANGES
		logval("wantp", ((int)now.wantp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 19 - dekker.pml:26 - [turn = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 23 - dekker.pml:28 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][23] = 1;
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

