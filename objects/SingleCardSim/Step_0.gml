if(running){
	repeat(hands_per_frame){
	run_hand()
	}
	if(total_games>=max_games){
	running=false;
	show_message(get_game_stats())
	}else{
		loading_bar.value = total_games	
	}
}