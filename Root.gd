extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TrackListRoot_next_track(seconds):
	$MidiRoot.reset()
	$Seekbar.reset()
	$Seekbar.start(seconds)
	$VideoRoot.play($TrackListRoot.selected_index)



func _on_Seekbar_play_clicked():
	$Seekbar.start($TrackListRoot.parse_seconds())
	$VideoRoot.play($TrackListRoot.selected_index)
