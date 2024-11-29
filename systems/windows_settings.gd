extends Control

# set and enforce a minimum width & height by adjusting these two values
# this will not change your overall project settings
# merely enforce a project settings minimum size 
var min_size = Vector2i(720, 1280)
@onready var window:Window = get_viewport().get_window()

func _ready():
	# set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", min_size.y)
	
	# enforce the minimum window size using DisplayServer
	window.min_size = min_size

func _process(_delta):
	# only enforce minimum size without adjusting the window size if it's above the min size
	if window.size.x < min_size.x or window.size.y < min_size.y:
		window.size = Vector2i(maxi(window.size.x, min_size.x), maxi(window.size.y, min_size.y))
