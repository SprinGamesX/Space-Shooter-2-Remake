/// @description
var _videoData = video_draw();
var _videoStatus = _videoData[0];
if (_videoStatus == 0){
	draw_surface(_videoData[1], 0, 0);
}
else instance_destroy();