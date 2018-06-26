///scr_camera_zoom(Camera_Zoom)

var zoom = argument0;
var zoom_Increment = 0.1;
var min_Zoom = 0.3;
var max_Zoom = 3;

#macro CameraDefaultWidth 1280
#macro CameraDefaultHeight 960
#macro CameraVeryClose 0.7
#macro CameraClose 0.8
#macro CameraDefault 1
#macro CameraFar 2
#macro CameraVeryFar 3
#macro CameraZoomIn -1
#macro CameraZoomOut -2

if (zoom >= min_Zoom && zoom <= max_Zoom)
{
	camera_set_view_size(view_camera[0], CameraDefaultWidth * zoom, CameraDefaultHeight * zoom)
	global.CurrentZoom *= zoom;
}

if (zoom == CameraZoomIn && global.CurrentZoom > min_Zoom)
{
	global.CurrentZoom -= zoom_Increment;
	camera_set_view_size(view_camera[0], CameraDefaultWidth * global.CurrentZoom, CameraDefaultHeight * global.CurrentZoom)
	
}else if (zoom == CameraZoomOut && global.CurrentZoom < max_Zoom)
{
	global.CurrentZoom += zoom_Increment;
	camera_set_view_size(view_camera[0], CameraDefaultWidth * global.CurrentZoom, CameraDefaultHeight * global.CurrentZoom)
}