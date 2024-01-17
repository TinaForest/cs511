	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM ltl_0 */
;
		;
		;
		;
		;
		;
		;
		;
		
	case 7: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC q */

	case 8: // STATE 1
		;
		now.wantq = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 12: // STATE 7
		;
		now.wantq = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 9
		;
		now.wantq = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 15
		;
		now.csq = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 17
		;
		now.csq = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 18
		;
		now.wantq = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 19
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 23
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC p */

	case 21: // STATE 1
		;
		now.wantp = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 25: // STATE 7
		;
		now.wantp = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 27: // STATE 9
		;
		now.wantp = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 15
		;
		now.csp = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 30: // STATE 17
		;
		now.csp = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 18
		;
		now.wantp = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 19
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 23
		;
		p_restor(II);
		;
		;
		goto R999;
	}

