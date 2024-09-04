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
function reset(){
	hand =[]
}
function toString()
{
	return (is_dealer ?"Dealer:" : "Player")+string(array_map(hand,function(card){return card.name}))+" - Sum:"+string(get_sum())+"- Score:"+string(get_score())	
}