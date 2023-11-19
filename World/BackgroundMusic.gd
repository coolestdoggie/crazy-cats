extends Node2D

var audio_files = [
	"res://Music/BGs/BG-1.wav",
	"res://Music/BGs/BG-2.wav",
	"res://Music/BGs/BG-3.wav",
	"res://Music/BGs/BG-4.wav",
	"res://Music/BGs/BG-5.wav",
	"res://Music/BGs/BG-6.wav",
	"res://Music/BGs/BG-7.wav",
	"res://Music/BGs/BG-8.wav"]
	

func _ready():
	for audio_file in audio_files
		var audio_stream_player = AudioStreamPlayer.new()
		audio_stream_player.stream = preload(audio_files[0])
		audio_stream_player.play()
		add_child(audio_stream_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
