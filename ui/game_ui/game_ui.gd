class_name GameUI
extends Control

@export var audio_game_over:AudioStream
@export var audio_highscore:AudioStream

@onready var ui_audio_player: UIAudioPlayer = $UIAudioPlayer
@onready var score_label: Label = $VBoxContainer/MarginContainer/score_label
@onready var end_screen: Control = $VBoxContainer/end_screen
@onready var restart_button: Button = $VBoxContainer/HBoxContainer/restart_button
@onready var back_button: Button = $VBoxContainer/HBoxContainer/back_button
@onready var game_over_label: Label = $VBoxContainer/end_screen/VBoxContainer/game_over_label

func _ready() -> void:
	SaveSystem.stats.games_count += 1
	GameManager.score_changed.connect(func(score:int): score_label.text = str(score))
	GameManager.game_changed.connect(func(game:int): if game == GameManager.Game.NEW: end_screen.hide())
	GameManager.game_changed.connect(func(game:int): if game == GameManager.Game.OVER: game_over())
	restart_button.pressed.connect(func(): ui_audio_player.button_pressed(); restart())
	back_button.pressed.connect(func(): ui_audio_player.button_pressed(); go_back())

func game_over():
	if GameManager.highscore:
		ui_audio_player.play_audio(audio_highscore)
		game_over_label.text = 'NEW HIGHSCORE!'
	else:
		ui_audio_player.play_audio(audio_game_over)
		game_over_label.text = 'GAME OVER'
	end_screen.show()

func restart():
	restart_button.release_focus()
	GameManager.game = GameManager.Game.NEW

func go_back():
	back_button.release_focus()
	GameManager.game = GameManager.Game.NEW
	get_tree().change_scene_to_file('res://ui/main_menu/main_menu.tscn')
