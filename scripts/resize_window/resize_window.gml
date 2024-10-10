// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function resize_window(){
if os_browser != browser_not_a_browser{
var a = browser_width;
var b = browser_height;


if os_browser = browser_safari_mobile or os_browser = browser_safari{
	window_set_size(browser_width, browser_height)
}
else{
	window_set_size(a, b);
}
}
}