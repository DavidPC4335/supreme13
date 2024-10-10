if(shown){
animation_frame+=0.1;
draw_set_color(c_black)
draw_rectangle(x-bw,y-bw,x+length+bw,y+height+bw,false)
draw_set_color(c_gray)
draw_rectangle(x,y,x+length,y+height,false)
draw_rectangle_color(x,y,x+length*min((value/stop),1),y+height,(sin(animation_frame+pi)/2+0.5)*255,(sin(animation_frame)/2+0.5)*255,(cos(animation_frame)/2+0.5)*255,(cos(animation_frame+pi)/2+0.5)*255,false)
animation.shown = value<stop-10

}else{
animation.shown = false
}