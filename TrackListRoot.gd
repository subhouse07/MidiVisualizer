extends Control

var selected_index = 0

const visible_track_count = 13
const track_count = 27

signal next_track

# Called when the node enters the scene tree for the first time.
func _ready():
	change_track_color(0, Color.green)
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_accept"):
		highlight_next_track()
		emit_signal("next_track")

func highlight_next_track():
	selected_index += 1
	if selected_index < track_count:
		change_track_color((selected_index - 1) * 2, Color.white)
		change_track_color(selected_index * 2, Color.green)
		if selected_index >= visible_track_count:
			$ScrollContainer.scroll_vertical += 19

func change_track_color(child_index, color):
	var track_container = $ScrollContainer/TrackGridContainer
	track_container.get_child(child_index).add_color_override("default_color", color)
	track_container.get_child(child_index + 1).add_color_override("default_color", color)
