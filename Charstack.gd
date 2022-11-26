extends Spatial

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
#	init_position()

func init_position():
	translation.x = rng.randf_range(X["min"], X["max"])
	translation.y = rng.randf_range(Y["min"], Y["max"])
	
func reset():
	init_position()
