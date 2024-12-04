class_name Brick
extends StaticBody2D

@export var resource:BrickResource

@onready var sprite_2d: Sprite2D = $Sprite2D

func init(r:BrickResource) -> void:
	resource = r
	sprite_2d.modulate = resource.color
