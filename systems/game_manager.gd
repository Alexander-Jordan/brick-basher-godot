extends Node

var score:int = 0 :
	set(s):
		score = s
		score_changed.emit(score)
var game_started:bool = false :
	set(gs):
		game_started = gs
		game_started_changed.emit(game_started)

signal score_changed(score:int)
signal game_started_changed(game_started:bool)
signal game_new
signal game_over
signal bricks_reset

func _input(event):
	if Input.is_action_just_pressed('dev_game_over'):
		game_over.emit()
	elif Input.is_action_just_pressed('dev_game_new'):
		game_new.emit()
	if Input.is_action_just_pressed('dev_bricks_reset'):
		bricks_reset.emit()
	if Input.is_action_just_pressed('dev_score_decrease'):
		score -= 10
	elif Input.is_action_just_pressed('dev_score_increase'):
		score += 10
