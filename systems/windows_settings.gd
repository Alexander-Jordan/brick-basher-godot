extends Control

# Set and Enforce a Minimum Wdith & Height by adjusting these two values 720 x 1280
# This will not change your overall project settings merely enforce a project settings minimum size 
var min_size = Vector2i(720, 1280)

func _ready():
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(min_size)

func _process(_delta):
	# Get the current window size
	var current_size = DisplayServer.window_get_size()

	# Only enforce minimum size without adjusting the window size if it's above the min size
	if current_size.x < min_size.x or current_size.y < min_size.y:
		DisplayServer.window_set_size(Vector2i(max(current_size.x, min_size.x), max(current_size.y, min_size.y)))
