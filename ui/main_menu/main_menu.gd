extends Control

@onready var start_button: Button = $VBoxContainer/VBoxContainer/start_button
@onready var exit_button: Button = $VBoxContainer/VBoxContainer/exit_button

func _ready() -> void:
	start_button.pressed.connect(func(): get_tree().change_scene_to_file('res://scenes/main.tscn'))
	exit_button.pressed.connect(func(): get_tree().quit())

func start():
	GameManager.state = GameManager.GAME_NEW
	get_tree().change_scene_to_file('res://scenes/main.tscn')
