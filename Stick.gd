extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if $RigidBody.linear_velocity == Vector3.ZERO:
		init_velocity()

func init_velocity():
	linear_velocity.x = rng.randf_range(-2.0, 2.0)
	linear_velocity.y = rng.randf_range(-2.0, 2.0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
