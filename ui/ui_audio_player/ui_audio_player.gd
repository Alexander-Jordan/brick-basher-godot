class_name UIAudioPlayer
extends AudioStreamPlayer

@export var audio_button_pressed:AudioStream

func play_audio(audio:AudioStream, callable:Callable = func():):
	stream = audio
	pitch_scale = randf_range(0.8, 1.2)
	play()
	finished.connect(callable)

func button_pressed(callable:Callable):
	play_audio(audio_button_pressed, callable)
