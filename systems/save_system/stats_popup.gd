extends PopupPanel

@onready var game_booted_value_label: Label = $MarginContainer/VBoxContainer/game_booted/value
@onready var games_value_label: Label = $MarginContainer/VBoxContainer/games/value
@onready var last_score_value_label: Label = $MarginContainer/VBoxContainer/last_score/value
@onready var best_score_value_label: Label = $MarginContainer/VBoxContainer/best_score/value
@onready var balls_served_value_label: Label = $MarginContainer/VBoxContainer/balls_served/value
@onready var bricks_destroyed_value_label: Label = $MarginContainer/VBoxContainer/bricks_destroyed/value
@onready var screens_cleared_value_label: Label = $MarginContainer/VBoxContainer/screens_cleared/value
@onready var entered_hard_morde_value_label: Label = $MarginContainer/VBoxContainer/entered_hard_mode/value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_booted_value_label.text = str(SaveSystem.stats.game_booted_count)
	games_value_label.text = str(SaveSystem.stats.games_count)
	last_score_value_label.text = str(SaveSystem.stats.last_score)
	best_score_value_label.text = str(SaveSystem.stats.best_score)
	balls_served_value_label.text = str(SaveSystem.stats.balls_served_count)
	bricks_destroyed_value_label.text = str(SaveSystem.stats.bricks_destroyed_count)
	screens_cleared_value_label.text = str(SaveSystem.stats.screens_cleared_count)
	entered_hard_morde_value_label.text = str(SaveSystem.stats.entered_hard_mode_count)
