extends CharacterBody2D

var speed:int = 2000

func _process(delta: float) -> void:
	var input_pos:Vector2 = get_viewport().get_mouse_position()
	velocity = Vector2(input_pos.x - position.x, 0) * speed * delta
	move_and_slide()
