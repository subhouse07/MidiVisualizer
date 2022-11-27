extends RigidBody

const X = {
	"max": 1.6,
	"min": -1.5
}

const Y = {
	"max": 20.0,
	"min": 15.0
}

var start_pos = Vector3()
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	init_velocity()

func _process(delta):
	if linear_velocity == Vector3.ZERO:
		init_velocity()

func init_velocity():
	linear_velocity.x = rng.randf_range(-2.0, 2.0)
	linear_velocity.y = rng.randf_range(-2.0, 2.0)
	
#func init_position():
#	translation.x = rng.randf_range(X["min"], X["max"])
#	translation.y = rng.randf_range(Y["min"], Y["max"])
#
#func reset():
#	init_position()

#func dissolve():
#	$RigidBody.mode = RigidBody.MODE_KINEMATIC
#	$RigidBody.linear_velocity = 0
#	$RigidBody.angular_velocity = 0
	
