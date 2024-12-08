extends Control

@onready var score_label: Label = $VBoxContainer/MarginContainer/score_label
@onready var end_screen: Control = $VBoxContainer/end_screen
@onready var restart_button: Button = $VBoxContainer/end_screen/VBoxContainer/restart_button
@onready var quit_button: Button = $VBoxContainer/end_screen/VBoxContainer/quit_button

func _ready() -> void:
	GameManager.score_changed.connect(func(score:int): score_label.text = str(score))
	GameManager.game_new.connect(func(): end_screen.hide())
	GameManager.game_over.connect(func(): end_screen.show())
	restart_button.pressed.connect(func(): GameManager.state = GameManager.GAME_NEW)
	quit_button.pressed.connect(func(): get_tree().quit())
