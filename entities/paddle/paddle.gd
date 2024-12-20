extends CharacterBody2D

enum Width {
	NORMAL = 8,
	HARD = 6,
	DEV = 101,
}

@export var ball:Ball

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
# used to lock the y-position
@onready var y_position:float = self.position.y

var input_pos:Vector2 = self.position
var speed:int = 2000
var lock_ball:bool = true
var width:int = Width.NORMAL :
	set(w):
		if w == width:
			return
		width = w
		match width:
			Width.HARD:
				sprite_2d.scale.x = 0.5
			Width.DEV:
				sprite_2d.scale.x = 13
			_:
				sprite_2d.scale.x = 1.0
		collision_shape_2d.shape.size.x = width

func _ready() -> void:
	GameManager.mode_changed.connect(func(mode:int): change_size_on_mode_change(mode))
	if ball:
		ball.reset_ball.connect(func(): lock_ball = true)

func _unhandled_input(event: InputEvent) -> void:
	if GameManager.game != GameManager.Game.OVER and event.is_action_pressed('serve'):
			serve_ball()

func _physics_process(delta: float) -> void:
	input_pos = get_viewport().get_mouse_position()
	# lock the y-position
	input_pos.y = y_position
	velocity = (input_pos - position) * speed * delta
	move_and_slide()
	
	if lock_ball:
		lock_ball_to_paddle()

func lock_ball_to_paddle() -> void:
	if ball:
		ball.position = Vector2(position.x, position.y - 10)

func serve_ball() -> void:
	if ball and lock_ball:
		lock_ball = false
		ball.serve()

func ball_velocity_after_bounce(ball_velocity:Vector2, ball_position:Vector2) -> Vector2:
	# new y should be:
	# - negative if the ball on impact is from the top of the paddle
	# - positive if the ball on impact is from the bottom of the paddle
	var new_y:float = -abs(ball_velocity.y) if ball_position.y <= position.y else abs(ball_velocity.y)
	# how far from the center in x-axis was the hit?
	var from_center:float = ball_position.x - position.x
	# new x is calculated by normalizing from_center (ex. 20 to -20 range -> 1 to -1 range)
	# that's done by dividing from_center with max value (in this case: width / 2)
	var new_x:float = from_center / ((width * scale.x) / 2)
	# clamp new_x so it doesn't shoot straight left or right
	new_x = clampf(new_x, -0.9, 0.9)
	return Vector2(new_x, new_y).normalized()

func change_size_on_mode_change(mode:int):
	match mode:
		GameManager.Mode.HARD:
			width = Width.HARD
		GameManager.Mode.DEV:
			width = Width.DEV
		_:
			width = Width.NORMAL
