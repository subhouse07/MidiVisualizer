extends Node2D

var sysex_on = true
var xg_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.open_midi_inputs()
	$SysexReceiver.is_sysex = true
	$SysexReceiver.status_on()
	$XGReceiver.stay_off()

func _unhandled_input(event):
	if event is InputEventMIDI:
		match event.message:
			MIDI_MESSAGE_NOTE_ON:
				if sysex_on:
					sysex_on = false
					$SysexReceiver.stay_off()
					$XGReceiver.stay_on()
				$NoteReceiver.status_on()
				$ChannelBars.get_child(event.channel).note_on(event.pitch, event.velocity)
			MIDI_MESSAGE_NOTE_OFF:
				$ChannelBars.get_child(event.channel).note_off(event.pitch)
			MIDI_MESSAGE_SYSTEM_EXCLUSIVE:
				print("Start received")

# Called when going to the next track
func reset():
	sysex_on = true
	$SysexReceiver.status_on()
