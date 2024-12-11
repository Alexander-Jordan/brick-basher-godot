class_name DevTools
extends Control

@onready var lives_value: Label = $VBoxContainer/params/lives/lives_value
@onready var brick_streak_value: Label = $VBoxContainer/params/brick_streak/brick_streak_value
@onready var speed_value: Label = $VBoxContainer/params/speed/speed_value
@onready var mode_value: Label = $VBoxContainer/params/mode/mode_value
@onready var game_value: Label = $VBoxContainer/params/game/game_value
@onready var highscore_value: Label = $VBoxContainer/params/highscore/highscore_value

var dev_mode_enabled = false

func _ready() -> void:
	GameManager.lives_changed.connect(func(lives:int): lives_value.text = str(lives))
	GameManager.brick_streak_changed.connect(func(brick_streak:int): brick_streak_value.text = str(brick_streak))
	GameManager.ball_speed_changed.connect(func(speed:int): speed_value.text = str(dict_key_from_value(GameManager.BallSpeed, speed)))
	GameManager.mode_changed.connect(func(mode:int): mode_value.text = str(dict_key_from_value(GameManager.Mode, mode)))
	GameManager.game_changed.connect(func(game:int):
		match game:
			GameManager.Game.NEW:
				game_value.text = 'NEW'
			GameManager.Game.OVER:
				game_value.text = 'OVER'
			GameManager.Game.IN_PLAY:
				game_value.text = 'IN_PLAY'
			GameManager.Game.WAITING:
				game_value.text = 'WAITING'
	)
	GameManager.highscore_changed.connect(func(highscore:bool): highscore_value.text = 'TRUE' if highscore else 'FALSE')

func dict_key_from_value(dict:Dictionary, value:int):
	for key in dict.keys():
		if value == dict[key]:
			return key
	return 'UNDEFINED'

func _input(event):
	if event is not InputEventKey:
		return
	
	if Input.is_action_just_pressed('dev_mode_enabled_toggle'):
		dev_mode_enabled = !dev_mode_enabled
		visible = dev_mode_enabled
	
	if dev_mode_enabled:
		if Input.is_action_just_pressed('dev_ball_speed_init'):
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.INIT)
		if Input.is_action_just_pressed('dev_ball_speed_medium'):
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.INIT)
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.MEDIUM)
		if Input.is_action_just_pressed('dev_ball_speed_fast'):
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.INIT)
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.FAST)
		if Input.is_action_just_pressed('dev_ball_speed_max'):
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.INIT)
			GameManager.ball_speed_changed.emit(GameManager.BallSpeed.MAX)
		if Input.is_action_just_pressed('dev_mode_toggle'):
			match GameManager.mode:
				GameManager.Mode.NORMAL:
					GameManager.mode = GameManager.Mode.HARD
				GameManager.Mode.HARD:
					GameManager.mode = GameManager.Mode.DEV
				_:
					GameManager.mode = GameManager.Mode.NORMAL
		if Input.is_action_just_pressed('dev_game_state_toggle'):
			match GameManager.game:
				GameManager.Game.NEW:
					GameManager.game = GameManager.Game.OVER
				GameManager.Game.OVER:
					GameManager.game = GameManager.Game.IN_PLAY
				GameManager.Game.IN_PLAY:
					GameManager.game = GameManager.Game.WAITING
				_:
					GameManager.game = GameManager.Game.NEW
		if Input.is_action_just_pressed('dev_bricks_clear'):
			GameManager.bricks_clear.emit()
		elif Input.is_action_just_pressed('dev_bricks_reset'):
			GameManager.bricks_reset.emit()
		if Input.is_action_pressed('dev_score_decrease'):
			if GameManager.score > 0:
				GameManager.score -= 10
		elif Input.is_action_pressed('dev_score_increase'):
			GameManager.score += 10
		if Input.is_action_pressed('dev_decrease_lives'):
			if GameManager.lives > 0:
				GameManager.lives -= 1
		elif Input.is_action_pressed('dev_increase_lives'):
			GameManager.lives += 1
		if Input.is_action_pressed('dev_bricks_streak_decrease'):
			if GameManager.brick_streak > 0:
				GameManager.brick_streak -= 1
		elif Input.is_action_pressed('dev_bricks_streak_increase'):
			GameManager.brick_streak += 1
		if Input.is_action_just_pressed('dev_highscore_toggle'):
			GameManager.highscore = !GameManager.highscore
