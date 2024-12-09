class_name Brick
extends StaticBody2D

@export var resource:BrickResource

@onready var sprite_2d: Sprite2D = $Sprite2D

var current_health:int = 1
var is_destroyed

signal destroyed

func init(r:BrickResource) -> void:
	resource = r
	sprite_2d.modulate = resource.color
	current_health = resource.health
	if is_destroyed:
		self.process_mode = Node.PROCESS_MODE_INHERIT
		self.show()
		is_destroyed = false

func take_damage(damage:int) -> void:
	assert(damage > 0, 'Damage is not allowed to be 0 or negative.')
	
	current_health = current_health - damage
	if current_health <= 0:
		destroy()

func destroy() -> void:
	self.process_mode = Node.PROCESS_MODE_DISABLED
	self.hide()
	GameManager.score += resource.score
	GameManager.brick_streak += 1
	if resource.max_speed_on_destroy:
		GameManager.ball_speed_changed.emit(GameManager.BallSpeed.MAX)
	is_destroyed = true
	destroyed.emit()
