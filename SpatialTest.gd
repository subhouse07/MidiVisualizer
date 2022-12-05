extends Spatial


var current_camera = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_accept"):
		current_camera += 1
		if current_camera == $Cameras.get_child_count():
			current_camera = 0
		$Cameras.get_child(current_camera).current = true


func _on_Timer_timeout():
	current_camera += 1
	if current_camera == $Cameras.get_child_count():
		current_camera = 0
	$Cameras.get_child(current_camera).current = true
