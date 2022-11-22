extends Node2D


# Declare member variables here. Examples:
var on_texture = preload("res://img/status_on.png")
var off_texture = preload("res://img/status_off.png")
var cooldown = 0
var reset_timer = 0 
var is_sysex = false

signal led_timeout

const RESET = 10
const TIMEOUT = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown > 0:
		cooldown -= 1
		if cooldown == 0:
			$Sprite.texture = off_texture
			if (is_sysex):
				reset_timer = RESET
	elif reset_timer > 0:
		reset_timer -= 1
		if reset_timer == 0:
			$Sprite.texture = on_texture
			cooldown = TIMEOUT

func status_on():
	$Sprite.texture = on_texture
	cooldown = TIMEOUT

func stay_on():
	cooldown = -1
	$Sprite.texture = on_texture

func stay_off():
	cooldown = -1
	reset_timer = -1
	$Sprite.texture = off_texture
