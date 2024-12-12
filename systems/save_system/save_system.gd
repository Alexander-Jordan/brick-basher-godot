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

var settings:Dictionary = {}
var stats:StatsData = StatsData.new()
var is_score_saveable:bool = true :
	set(iss):
		if is_score_saveable == iss:
			return
		is_score_saveable = iss

func _ready() -> void:
	if !DirAccess.dir_exists_absolute(SAVE_FOLDER_PATH):
		DirAccess.make_dir_absolute(SAVE_FOLDER_PATH)
	
	load_stats()
	load_settings()
	
	stats.game_booted_count += 1
	save_stats()

func _notification(what):
	# make sure to always save before closing down the game
	# NOTIFICATION_WM_GO_BACK_REQUEST is used for an android back-button
	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_WM_GO_BACK_REQUEST:
		save_stats()
		get_tree().quit()

func save_stats():
	ResourceSaver.save(stats, SAVE_FOLDER_PATH + SAVE_FILE_NAME)

func save_settings():
	# create new ConfigFile object
	var config = ConfigFile.new()
	
	for config_section in settings:
		for config_section_key in settings[config_section]:
			config.set_value(config_section, config_section_key, settings[config_section][config_section_key])
	
	# finally save to file
	config.save(SETTINGS_FILE_PATH)

func load_stats():
	if ResourceLoader.exists(SAVE_FOLDER_PATH + SAVE_FILE_NAME):
		stats = ResourceLoader.load(SAVE_FOLDER_PATH + SAVE_FILE_NAME).duplicate(true)

func load_settings():
	# create new ConfigFile object
	var config = ConfigFile.new()
	# load in existing settings from file
	var error = config.load(SETTINGS_FILE_PATH)
	
	# if no file
	if error != OK:
		# get default data from constant
		settings = SETTINGS_DEFAULT.duplicate(true)
		# save and return
		save_settings()
		return
	
	# set data from config file
	for config_section in config.get_sections():
		settings[config_section] = {}
		for config_section_key in config.get_section_keys(config_section):
			settings[config_section][config_section_key] = config.get_value(config_section, config_section_key)

func save_score(score:int) -> void:
	if is_score_saveable:
		stats.last_score = score
		if score > stats.best_score:
			GameManager.highscore = true
			stats.best_score = score
	save_stats()
