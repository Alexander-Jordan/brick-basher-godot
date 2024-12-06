extends Control

@onready var score_label: Label = $MarginContainer/score

func _ready() -> void:
	GameManager.score_changed.connect(func(score:int): score_label.text = str(score))
