	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		((P1 *)_this)->_4_1_i = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 5
		;
		((P1 *)_this)->_4_1_next_id = trpt->bup.ovals[1];
		((P1 *)_this)->_4_1_id = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 5: // STATE 6
		;
	/* 1 */	((P1 *)_this)->_4_1_next_id = trpt->bup.ovals[1];
	/* 0 */	((P1 *)_this)->_4_1_id = trpt->bup.ovals[0];
		;
		delproc(0, now._nr_pr-1);
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 6: // STATE 7
		;
		((P1 *)_this)->_4_1_i = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 8
		;
	/* 0 */	((P1 *)_this)->_4_1_i = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC nnode */

	case 9: // STATE 1
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		;
		goto R999;

	case 10: // STATE 2
		;
		XX = 1;
		unrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 0, 2, 1);
		unrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 1, ((int)((P0 *)_this)->eId), 0);
		((P0 *)_this)->eId = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		
	case 12: // STATE 4
		goto R999;

	case 13: // STATE 6
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		;
		goto R999;
;
		
	case 14: // STATE 7
		goto R999;

	case 15: // STATE 9
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		;
		goto R999;

	case 16: // STATE 13
		;
		XX = 1;
		unrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 0, 1, 1);
		unrecv(now.ch[ Index(((int)((P0 *)_this)->id), 5) ], XX-1, 1, ((int)((P0 *)_this)->lId), 0);
		((P0 *)_this)->lId = trpt->bup.oval;
		;
		;
		goto R999;

	case 17: // STATE 14
		;
		((P0 *)_this)->leader_id = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 18: // STATE 16
		goto R999;

	case 19: // STATE 18
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)_this)->next_id), 5) ]);
		;
		goto R999;
;
		
	case 20: // STATE 19
		goto R999;

	case 21: // STATE 26
		;
		p_restor(II);
		;
		;
		goto R999;
	}

