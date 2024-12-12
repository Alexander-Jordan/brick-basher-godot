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

var settings:Dictionary = SETTINGS_DEFAULT
var stats:StatsData = StatsData.new()
var is_score_saveable:bool = true :
	set(iss):
		if is_score_saveable == iss:
			return
		is_score_saveable = iss

func _ready() -> void:
	stats.game_booted_count += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save_score(score:int) -> void:
	if is_score_saveable:
		stats.last_score = score
		if score > stats.best_score:
			GameManager.highscore = true
			stats.best_score = score
