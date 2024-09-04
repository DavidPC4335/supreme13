deck = instance_create_depth(0,0,0,Deck);

hands = [instance_create_depth(0,0,0,Hand)
,instance_create_depth(0,0,0,Hand)]

//0 in hand array is ALWAYS dealer
hands[0].is_dealer=true;

function reset()
{
deck.reset_deck()
for(var i=0;i<hands.length;i++){
	hands[i].reset();	
}

}

function play_hand(){
	array_foreach(hands,function(hand){
		hand.pull_card(deck)
	})	
	//logic for betting stage(if required)
	array_foreach(hands,function(hand){
		hand.pull_card(deck)
	})	
	//optional third card for dealer
	if(hands[0].get_sum() < 8){
		hands[0].pull_card(deck)	
	}
}



function toString()
{
	return "Game:\nHands:\n"+string(array_map(hands,function(hand,index){return hand.toString()}))
	+"\nDeck"+deck.toString()
}