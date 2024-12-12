extends AudioStreamPlayer

var playback_position:float = 0.0

func _ready() -> void:
	GameManager.game_changed.connect(func(game:int): if game == GameManager.Game.IN_PLAY: play(playback_position))
	GameManager.game_changed.connect(func(game:int):
		if game in [GameManager.Game.NEW, GameManager.Game.WAITING]:
			playback_position = get_playback_position() if game == GameManager.Game.WAITING else 0.0
			stop()
	)
