extends Node

const SAVE_FOLDER_PATH:String = 'user://save/'
const SAVE_FILE_NAME:String = 'stats_data.tres'
const SETTINGS_FILE_PATH:String = 'user://SETTINGS.cfg'
const SETTINGS_DEFAULT:Dictionary = {
  'audio': {
	'master': true,
	'music': true,
	'sfx': true,
  }
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
