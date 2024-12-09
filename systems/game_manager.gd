extends Node

enum {
	GAME_OVER,
	GAME_NEW,
}

enum Mode {
	NORMAL,
	HARD,
}

enum BallSpeed {
	INIT = 200,
	MEDIUM = 300,
	FAST = 400,
	SUPER = 500,
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
				lives = 3
				score = 0
				brick_streak = 0
			_:
				return
var mode:int = Mode.NORMAL :
	set(m):
		if mode == m or m not in Mode.values():
			return
		mode = m
		mode_changed.emit(mode)
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
var brick_streak:int = 0 :
	set(bs):
		brick_streak = 0 if bs < 0 else bs
		match bs:
			0:
				ball_speed_changed.emit(BallSpeed.INIT)
			4:
				ball_speed_changed.emit(BallSpeed.MEDIUM)
			12:
				ball_speed_changed.emit(BallSpeed.FAST)
			_:
				return

signal ball_speed_changed(speed:int)
signal mode_changed(mode:int)
signal lives_changed(lives:int)
signal score_changed(score:int)
signal game_new
signal game_over
signal bricks_reset
signal bricks_clear

func _input(_event):
	if Input.is_action_just_pressed('dev_ball_speed_init'):
		ball_speed_changed.emit(BallSpeed.INIT)
	if Input.is_action_just_pressed('dev_ball_speed_medium'):
		ball_speed_changed.emit(BallSpeed.INIT)
		ball_speed_changed.emit(BallSpeed.MEDIUM)
	if Input.is_action_just_pressed('dev_ball_speed_fast'):
		ball_speed_changed.emit(BallSpeed.INIT)
		ball_speed_changed.emit(BallSpeed.FAST)
	if Input.is_action_just_pressed('dev_ball_speed_super'):
		ball_speed_changed.emit(BallSpeed.INIT)
		ball_speed_changed.emit(BallSpeed.SUPER)
	if Input.is_action_just_pressed('dev_mode_toggle'):
		mode = Mode.HARD if mode == Mode.NORMAL else Mode.NORMAL
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
