extends Node

enum Game {
	OVER,
	NEW,
	IN_PLAY,
	WAITING,
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

var game:int = Game.NEW :
	set(g):
		if g == game:
			return
		assert(g in Game.values(), '%s is not a valid Game state.' % str(g))
		game = g
		game_changed.emit(game)
		if game == Game.NEW:
			lives = 3
			score = 0
			highscore = false
			brick_streak = 0
var mode:int = Mode.NORMAL :
	set(m):
		if mode == m:
			return
		assert(m in Mode.values(), '%s is not a valid Mode.' % str(m))
		mode = m
		mode_changed.emit(mode)
var lives:int = 3 :
	set(l):
		lives = l if l > 0 else 0
		lives_changed.emit(lives)
		if lives < 1:
			await get_tree().create_timer(1.0).timeout
			game = Game.OVER
var score:int = 0 :
	set(s):
		score = s if s > 0 else 0
		score_changed.emit(score)
var highscore:bool = false :
	set(h):
		if h == highscore:
			return
		highscore = h
		highscore_changed.emit(highscore)
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
signal highscore_changed(highscore:bool)
signal game_changed(game:int)
signal game_in_play
signal game_waiting
signal bricks_reset
signal bricks_clear
