dd = instance_create_depth(x+100,y,0,DropDownComponent)
btn = instance_create_depth(x,y+50,0,Button)
btn.text="Run"
btn.onClick=function(){
	run_hand();	
}
game = instance_create_depth(0,0,0,Game);
function run_hand(){
	game.play_hand()
}