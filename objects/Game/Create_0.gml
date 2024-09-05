enum GAMERESULT
{
 LOSE,
 WIN,
 TIE
}



deck = instance_create_depth(0,0,0,Deck);

player_first_card_index =-1;

hands = [instance_create_depth(0,0,0,Hand)
,instance_create_depth(0,0,0,Hand)]

//0 in hand array is ALWAYS dealer
hands[0].is_dealer=true;

function reset()
{
deck.reset_deck()
for(var i=0;i<array_length(hands);i++){
	hands[i].reset();	
}

}

function play_hand(){
	array_foreach(hands,function(hand,index){
		if(index > 0 && player_first_card_index >=0){
			hand.pull_card_index(deck,player_first_card_index);
		}else{
		hand.pull_card(deck)
		}
	})	
	
	//logic for betting stage(if required)
	
	array_foreach(hands,function(hand){
		hand.pull_card(deck)
	})	
	//optional third card for dealer
	if(hands[0].get_sum() < 8){
		hands[0].pull_card(deck)	
	}
	//returns the results
	var _dealer_score = hands[0].get_score()
	var _result=[]
	
	for(var i=1;i<array_length(hands);i++){
		var _player_score = hands[i].get_score()
		var _player_bust = _player_score > 5
		var _dealer_bust = _dealer_score > 5
		var _res ={}
		//bust logic
		if(_dealer_bust){
			_res.result = GAMERESULT.WIN
		}else if (_player_bust){
			_res.result = GAMERESULT.LOSE
		}else{
		
			//if dealer wins
			if(_player_score > _dealer_score){
			//if dealer wins	
				_res.result = GAMERESULT.LOSE
			}else if (_player_score < _dealer_score){
			//if player wins
				_res.result = GAMERESULT.WIN
			}else{
				//TIE
				_res.result = GAMERESULT.TIE
			}
		}
		
		_res.bet_muitiplier = get_bet_muitiplier(_res.result,hands[i])
		
		
		_res.score=_player_score
	
		array_push(_result,_res)
	}
	return _result
}


function get_bet_muitiplier(result,hand){
	
	var _mult=0;
	
	switch(result){
		case GAMERESULT.WIN:
			_mult+=2
		break;
		case GAMERESULT.TIE:
			_mult+=1
		break;
		
	}
	_mult+=hand.get_blind_bet_multiplier();
	//show_message({_mult,hand:hand.toString()})
	return _mult;
}






function toString()
{
	return "Game:\nHands:\n"+string(array_map(hands,function(hand,index){return hand.toString()}))
	+"\n\n\n\nDeck"
	//+deck.toString()
}