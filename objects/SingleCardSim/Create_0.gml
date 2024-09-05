hands_per_frame=100;
show_debug_overlay(true)

btn = instance_create_depth(x,y+50,0,Button)
btn.text="Run"

set_card_checkbox = instance_create_depth(x,y+100,0,CheckBox)
set_card_checkbox.text="Set Card"

reset_btn = instance_create_depth(x+100,y+50,0,Button)
reset_btn.text = "Reset"
reset_btn.image_blend=c_gray
reset_btn.onClick = function(){
	reset()	
}

loading_bar = instance_create_depth(x+150,y-250,0,LoadingBar)
loading_bar.shown=false
card_index=undefined

dd = instance_create_depth(x+170,y,0,DropDownComponent)
dd.onChange = function(e){
	card_index=e;
	game.player_first_card_index=e
}



bet=0;
bet_per_hand =1
running =false
player_wins=0;
player_losses=0;
total_games =0
max_games = 100000
loading_bar.stop = max_games








function reset(){
	player_wins=0;
	player_losses=0;
	total_games =0
	bet=0;
}

btn.onClick=function(){
	running=!running
	btn.text=running?"Stop":"Run"
	btn.image_blend = running ? c_red:c_green
	set_card_checkbox.shown = !running
	loading_bar.shown = running
}
game = instance_create_depth(0,0,0,Game);
function run_hand(){
	//one for ante 1 for blind
	bet -= bet_per_hand*2;
	total_games++
	game.reset()
	
	result = game.play_hand()
	var _result = result[0]
	//show_message(_result)
	
	//Standard game rules
	if(_result.result == GAMERESULT.WIN){
		//win double on the ante and blind back
		player_wins++
	}else if (_result.result == GAMERESULT.LOSE){
		player_losses++
	}else{
		//on Tie	
	}
	bet += bet_per_hand*_result.bet_muitiplier

}
function get_game_stats(){
return"Card:"+ string(card_index>=0 ? (game.deck.get_clean_deck()[card_index].name):"Random")
+ "\n\nGameStats\nPlayer_wins:"+string(player_wins)
+"\nPlayer_losses:"+string(player_losses)
+"\nTotal_Games:"+string(total_games)
+"\n\t%Win: %"+string(real(player_wins/total_games)*100)
+"\n\t%Loss: %"+string(real(player_losses/total_games)*100)
+"\n\t%Ties: %"+string(real((total_games-(player_losses+player_wins))/total_games)*100)

+"\n\nBet +/-: "+string(bet)
+"\nBet Expected Value +/-: "+string(bet/total_games)	
}