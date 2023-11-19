extends AudioStreamPlayer2D

@export var audio_files : Array[AudioStreamWAV]
var current_index : int = 0
	

func _ready():
	current_index = randi_range(0, audio_files.size()-1)
	play_current_track()

func play_current_track():
	stream = audio_files[current_index]
	play()
	
func _on_finished():
	current_index = current_index + 1
	if current_index == audio_files.size():
		current_index = 0
		
	play_current_track()
