extends Node

enum {
	GAME_OVER,
	GAME_NEW,
}

var state:int = GAME_NEW :
	set(gs):
		match gs:
			GAME_OVER:
				state = gs
				game_over.emit()
			GAME_NEW:
				state = gs
				game_new.emit()
				score = 0
				lives = 3
			_:
				return
var lives:int = 3 :
	set(l):
		lives = l
		lives_changed.emit(lives)
		if lives < 1:
			await get_tree().create_timer(1.0).timeout
			state = GAME_OVER
var score:int = 0 :
	set(s):
		score = s
		score_changed.emit(score)

signal lives_changed(lives:int)
signal score_changed(score:int)
signal game_new
signal game_over
signal bricks_reset
signal bricks_clear

func _input(_event):
	if Input.is_action_just_pressed('dev_game_over'):
		state = GAME_OVER
	elif Input.is_action_just_pressed('dev_game_new'):
		state = GAME_NEW
	if Input.is_action_just_pressed('dev_bricks_clear'):
		bricks_clear.emit()
	elif Input.is_action_just_pressed('dev_bricks_reset'):
		bricks_reset.emit()
	if Input.is_action_just_pressed('dev_score_decrease'):
		score -= 10
	elif Input.is_action_just_pressed('dev_score_increase'):
		score += 10
