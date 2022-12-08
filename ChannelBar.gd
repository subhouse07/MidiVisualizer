extends Node2D


const BAR_VAL = 7
const COOLDOWN_SPEED = 300
const NOTE_COOLDOWN_SPEED = 200

var notes: Dictionary = {}
var max_velocity = 0
var note_on_cooldown = 0
var note_on_cooling = false
var cooldown = 0
var cooling = false
const off_textures = [
	preload("res://img/0_0.png"),
	preload("res://img/1_0.png"),
	preload("res://img/2_0.png"),
	preload("res://img/3_0.png"),
	preload("res://img/4_0.png"),
	preload("res://img/5_0.png"),
	preload("res://img/6_0.png"),
	preload("res://img/7_0.png"),
	preload("res://img/8_0.png"),
	preload("res://img/9_0.png"),
	preload("res://img/10_0.png"),
	preload("res://img/11_0.png"),
	preload("res://img/12_0.png"),
	preload("res://img/13_0.png"),
	preload("res://img/14_0.png"),
	preload("res://img/15_0.png")
]
const on_textures = [
	preload("res://img/0_1.png"),
	preload("res://img/1_1.png"),
	preload("res://img/2_1.png"),
	preload("res://img/3_1.png"),
	preload("res://img/4_1.png"),
	preload("res://img/5_1.png"),
	preload("res://img/6_1.png"),
	preload("res://img/7_1.png"),
	preload("res://img/8_1.png"),
	preload("res://img/9_1.png"),
	preload("res://img/10_1.png"),
	preload("res://img/11_1.png"),
	preload("res://img/12_1.png"),
	preload("res://img/13_1.png"),
	preload("res://img/14_1.png"),
	preload("res://img/15_1.png")
]
#var velocity_sum = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# 127 / 16
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if notes.size() > 0:
		var lit = ((max_velocity / BAR_VAL) / 2) + (note_cooldown_mod(delta) / 2)
		light_notes(lit)
	else:
		var lit = ((cooldown / BAR_VAL) / 2) + (note_cooldown_mod(delta) / 2)
		if (cooling):
			light_notes(lit)
			cooling = lit > 0
			cooldown = calc_cooldown_update(cooldown, delta, COOLDOWN_SPEED)

func light_notes(threshold):
	for i in 16:
		if threshold > i:
			$Sprites.get_child(i).texture = on_textures[i]
		else:
			$Sprites.get_child(i).texture = off_textures[i]

func note_on(pitch, velocity):
	note_on_cooling = true
	notes[pitch] = velocity
	note_on_cooldown = velocity
#	velocity_sum += velocity
	if velocity > max_velocity:
		max_velocity = velocity


func note_off(pitch):
	var velocity = notes[pitch]
#	velocity_sum -= notes[pitch]
	notes.erase(pitch)
	if (notes.empty()):
		cooling = true
		cooldown = max_velocity # I think this might be causing some of the weirdness
	if max_velocity == velocity:
		var new_max = 0
		for v in notes:
			if v >= new_max:
				new_max = v
		max_velocity = new_max

func note_cooldown_mod(delta):
	if note_on_cooling:
		var cooldown_value = note_on_cooldown
		note_on_cooldown = calc_cooldown_update(note_on_cooldown, delta, NOTE_COOLDOWN_SPEED)
		if note_on_cooldown == 0:
			note_on_cooling = false
		return cooldown_value / BAR_VAL
	else:
		return 0

func calc_cooldown_update(current, delta, speed):
	return max(current - floor(speed * delta), 0)
