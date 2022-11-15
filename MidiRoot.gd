extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.open_midi_inputs()
	var midi_inputs = OS.get_connected_midi_inputs()
	for i in midi_inputs:
		print(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if event is InputEventMIDI:
		match event.message:
			MIDI_MESSAGE_NOTE_ON:
				print("Note on")
			MIDI_MESSAGE_NOTE_OFF:
				print("Note off")
