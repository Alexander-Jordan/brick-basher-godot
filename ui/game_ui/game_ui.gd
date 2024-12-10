class_name GameUI
extends Control

@onready var score_label: Label = $VBoxContainer/MarginContainer/score_label
@onready var end_screen: Control = $VBoxContainer/end_screen
@onready var back_button: Button = $VBoxContainer/HBoxContainer/back_button
@onready var restart_button: Button = $VBoxContainer/HBoxContainer/restart_button

func _ready() -> void:
	GameManager.score_changed.connect(func(score:int): score_label.text = str(score))
	GameManager.game_new.connect(func(): end_screen.hide())
	GameManager.game_over.connect(func(): end_screen.show())
	restart_button.pressed.connect(func(): GameManager.state = GameManager.GAME_NEW)
	back_button.pressed.connect(go_back)

func go_back():
	GameManager.state = GameManager.GAME_NEW
	get_tree().change_scene_to_file('res://ui/main_menu/main_menu.tscn')
