extends Node

enum {
	GAME_OVER,
	GAME_NEW,
}

enum Mode {
	NORMAL,
	HARD,
	DEV,
}

enum BallSpeed {
	INIT = 200,
	MEDIUM = 300,
	FAST = 400,
	MAX = 500,
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
		lives = l if l > 0 else 0
		lives_changed.emit(lives)
		if lives < 1:
			await get_tree().create_timer(1.0).timeout
			state = GAME_OVER
var score:int = 0 :
	set(s):
		score = s if s > 0 else 0
		score_changed.emit(score)
var brick_streak:int = 0 :
	set(bs):
		brick_streak = bs if bs > 0 else 0
		brick_streak_changed.emit(brick_streak)
		match bs:
			0:
				ball_speed_changed.emit(BallSpeed.INIT)
			4:
				ball_speed_changed.emit(BallSpeed.MEDIUM)
			12:
				ball_speed_changed.emit(BallSpeed.FAST)
			_:
				return

signal brick_streak_changed(brick_streak:int)
signal ball_speed_changed(speed:int)
signal mode_changed(mode:int)
signal lives_changed(lives:int)
signal score_changed(score:int)
signal game_new
signal game_over
signal bricks_reset
signal bricks_clear
