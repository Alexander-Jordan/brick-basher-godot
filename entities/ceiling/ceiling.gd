class_name Ceiling
extends StaticBody2D

func trigger_mode_change():
	if GameManager.mode != GameManager.Mode.DEV:
		GameManager.mode = GameManager.Mode.HARD
