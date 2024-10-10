resize_window()
	
	

if(running){
	var _stime = get_timer()
	repeat(hands_per_frame){
	run_hand()
	}
	if(total_games>=max_games){
		if(card_index < 13){
			
			//show_message(get_game_stats())
			update_csv();
			//show_message(csv)
			dd.onChange(card_index+1)
			reset()
		}else{
			btn.onClick();
			get_string("Csv Data:",csv);
		}
	}else{
		loading_bar.value = total_games	
	}
	var _etime = get_timer()
	//number of seconds passed
	var _dtime = (_etime -_stime)/1000000
	if(_dtime > 1/70)//if game id taking longer then 70fps
	{
		hands_per_frame-=1
	}else{
		hands_per_frame++	
	}
}