//wiw be populatied on creation
deck = undefined;
function get_clean_deck(){
return [
    { name: "Ace of Spades", value: 11 },
    { name: "2 of Spades", value: 2 },
    { name: "3 of Spades", value: 3 },
    { name: "4 of Spades", value: 4 },
    { name: "5 of Spades", value: 5 },
    { name: "6 of Spades", value: 6 },
    { name: "7 of Spades", value: 7 },
    { name: "8 of Spades", value: 8 },
    { name: "9 of Spades", value: 9 },
    { name: "10 of Spades", value: 10 },
    { name: "Jack of Spades", value: 10 },
    { name: "Queen of Spades", value: 10 },
    { name: "King of Spades", value: 10 },
    
    { name: "Ace of Hearts", value: 11 },
    { name: "2 of Hearts", value: 2 },
    { name: "3 of Hearts", value: 3 },
    { name: "4 of Hearts", value: 4 },
    { name: "5 of Hearts", value: 5 },
    { name: "6 of Hearts", value: 6 },
    { name: "7 of Hearts", value: 7 },
    { name: "8 of Hearts", value: 8 },
    { name: "9 of Hearts", value: 9 },
    { name: "10 of Hearts", value: 10 },
    { name: "Jack of Hearts", value: 10 },
    { name: "Queen of Hearts", value: 10 },
    { name: "King of Hearts", value: 10 },
    
    { name: "Ace of Diamonds", value: 11 },
    { name: "2 of Diamonds", value: 2 },
    { name: "3 of Diamonds", value: 3 },
    { name: "4 of Diamonds", value: 4 },
    { name: "5 of Diamonds", value: 5 },
    { name: "6 of Diamonds", value: 6 },
    { name: "7 of Diamonds", value: 7 },
    { name: "8 of Diamonds", value: 8 },
    { name: "9 of Diamonds", value: 9 },
    { name: "10 of Diamonds", value: 10 },
    { name: "Jack of Diamonds", value: 10 },
    { name: "Queen of Diamonds", value: 10 },
    { name: "King of Diamonds", value: 10 },
    
    { name: "Ace of Clubs", value: 11 },
    { name: "2 of Clubs", value: 2 },
    { name: "3 of Clubs", value: 3 },
    { name: "4 of Clubs", value: 4 },
    { name: "5 of Clubs", value: 5 },
    { name: "6 of Clubs", value: 6 },
    { name: "7 of Clubs", value: 7 },
    { name: "8 of Clubs", value: 8 },
    { name: "9 of Clubs", value: 9 },
    { name: "10 of Clubs", value: 10 },
    { name: "Jack of Clubs", value: 10 },
    { name: "Queen of Clubs", value: 10 },
    { name: "King of Clubs", value: 10 }
];	
}
function reset_deck()
{
deck = get_clean_deck();	
}
reset_deck();

function pull_card_index(index){
	var _card = deck[index]
	array_delete(deck,index,1);
	//show_message(_card.name)
	return _card;
}
function pull_card()
{
	//random_set_seed(get_timer())

	var _len = array_length(deck)-1;
	var _index = irandom_range(0,_len);
	
	return pull_card_index(_index);
}



function toString()
{
return string(array_map(deck,function(card){return string_char_at(card.name,1)}))	
}