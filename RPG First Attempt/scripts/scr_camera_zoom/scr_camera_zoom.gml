///scr_camera_zoom(Camera_Zoom)

var zoom = argument0;
var zoom_Increment = 0.1;
var min_Zoom = 0.3;
var max_Zoom = 3;

#macro DefaultCameraWidth 1280
#macro DefaultCameraHeight 960

if (zoom >= min_Zoom && zoom <= max_Zoom)
{
	camera_set_view_size(view_camera[0], DefaultCameraWidth * zoom, DefaultCameraHeight * zoom)
	//view_set_wport(view_camera[0],  DefaultCameraWidth * zoom)
	//view_set_hport(view_camera[0],  DefaultCameraHeight * zoom)
	global.Current_Zoom *= zoom;
}

if (zoom == Camera_Zoom.ZoomIn && global.Current_Zoom > min_Zoom)
{
	global.Current_Zoom -= zoom_Increment;
	camera_set_view_size(view_camera[0], DefaultCameraWidth * global.Current_Zoom, DefaultCameraHeight * global.Current_Zoom)
	
}else if (zoom == Camera_Zoom.ZoomOut && global.Current_Zoom < max_Zoom)
{
	global.Current_Zoom += zoom_Increment;
	camera_set_view_size(view_camera[0], DefaultCameraWidth * global.Current_Zoom, DefaultCameraHeight * global.Current_Zoom)
}