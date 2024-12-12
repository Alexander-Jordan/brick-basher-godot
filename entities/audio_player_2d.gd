class_name AudioPlayer2D
extends AudioStreamPlayer2D

func play_audio(audio:AudioStream):
	stream = audio
	pitch_scale = randf_range(0.8, 1.2)
	play()
