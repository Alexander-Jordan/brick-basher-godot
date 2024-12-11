class_name Ball
extends CharacterBody2D

@export var bounce_wall:AudioStream
@export var bounce_paddle:AudioStream
@export var bounce_brick:AudioStream
@export var audio_ball_lost:AudioStream

@onready var audio_player_2d: AudioPlayer2D = $AudioPlayer2D

var speed:int = GameManager.BallSpeed.INIT :
	set(s):
		if s > GameManager.BallSpeed.INIT and s <= speed:
			return
		speed = s
var rng = RandomNumberGenerator.new()
var direction:Vector2 = Vector2.ZERO

signal reset_ball

func _ready() -> void:
	GameManager.game_changed.connect(func(game:int): if game == GameManager.Game.NEW: reset())
	GameManager.ball_speed_changed.connect(func(s:int): speed = s)

func reset() -> void:
	velocity = Vector2.ZERO
	reset_ball.emit()

func serve():
	direction = Vector2(rng.randf_range(-1, 1), -1)
	velocity = direction.normalized()
	GameManager.game = GameManager.Game.IN_PLAY
	audio_player_2d.play_audio(bounce_paddle)
 
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collider:Object = collision.get_collider()
		if handle_velocity_after_collision(collider):
			audio_player_2d.play_audio(bounce_paddle)
			return
		
		# if the velocity was not handled after collision, just bounce
		velocity = velocity.bounce(collision.get_normal())
		
		if collider.has_method('take_damage'):
			collider.take_damage(1)
			audio_player_2d.play_audio(bounce_brick)
			return
		
		if collider.has_method('trigger_mode_change'):
			collider.trigger_mode_change()
		
		audio_player_2d.play_audio(bounce_wall)

func handle_velocity_after_collision(object:Object) -> bool:	
	# then check if the velocity should be handled
	if object.has_method('ball_velocity_after_bounce'):
		velocity = object.ball_velocity_after_bounce(velocity, position)
		return true
	
	# returning false means that the velocity was not handled
	return false

func _on_screen_exited() -> void:
	GameManager.game = GameManager.Game.WAITING
	audio_player_2d.play_audio(audio_ball_lost)
	velocity = Vector2.ZERO
	GameManager.lives -= 1
	GameManager.brick_streak = 0
	GameManager.mode = GameManager.Mode.NORMAL
	if GameManager.lives > 0:
		await get_tree().create_timer(1.0).timeout
		reset()
