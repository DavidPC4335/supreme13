// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_suit_index(card){
if(string_last_pos("Spades",card.name) >0){
	return 0;	
}else if (string_last_pos("Hearts",card.name) >0){
	return 1;	
}else if (string_last_pos("Diamonds",card.name) >0){
	return 2;	
}else if (string_last_pos("Clubs",card.name) >0){
	return 3;	
}
}