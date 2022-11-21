extends Node2D


# Declare member variables here. Examples:
var on_texture = preload("res://img/status_on.png")
var off_texture = preload("res://img/status_off.png")
var cooldown = 0

const TIMEOUT = 6


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown > 0:
		cooldown -= 1
		if cooldown == 0:
			$Sprite.texture = off_texture

func status_on():
	$Sprite.texture = on_texture
	cooldown = TIMEOUT
