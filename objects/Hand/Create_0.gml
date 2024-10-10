is_dealer =false;
hand =[]
function pull_card(deck)
{
	if(array_length(hand)<2+is_dealer){
		var _card = deck.pull_card()
		array_push(hand,_card)
		return _card
	}
	return -1;
}
function pull_card_index(deck,index)
{
	if(array_length(hand)<2+is_dealer){
		var _card = deck.pull_card_index(index)
		array_push(hand,_card)
		return _card
	}
	return -1;
}
function get_sum()
{
	var _sum=0;
	for(var i=0;i<array_length(hand);i++){
		_sum +=hand[i].value
	}
	return _sum;
}
/// @desc gets the distnace the hands score is from 13 (lower is better)
function get_score()
{
	var _sum = get_sum();
	return abs(_sum-13);
}
function get_blind_bet_multiplier(){
	var _mult=1;
	if(get_score() !=0){
		return 0;
	}
	_ace = -1;
	
	_ace_suit =-1
	array_foreach(hand,function(card,index){
		if(string_char_at(card.name,1)=="A"){
			_ace=index
			_ace_suit = get_suit_index(card);
		}
	
	})
	
	if(_ace > -1){
		//Ace/duece odds
		_mult = 1+(3/2)	
		//show_message("Ace:"+string(_ace))
		if(_ace_suit == get_suit_index(hand[_ace==0?1:0])){
			_mult=1+5
			//if Spades(supreme13)
			if(_ace_suit ==0){
				//show_message("Supreme13:"+toString())
				_mult = 1+10
			}
		}
	}
	
	//show_message("mult:"+string(_mult)+toString())
	return _mult;
}

function reset(){
	hand =[]
}



function toString()
{
	return (is_dealer ?"Dealer:" : "Player")+string(array_map(hand,function(card){return card.name}))+" - Sum:"+string(get_sum())+"- Score:"+string(get_score())	
}