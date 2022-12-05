extends Node2D

var ogv_resources = [
	preload("res://ogv/bitsbytescomp_libtheora.ogv"),
	preload("res://ogv/commute_people_libtheora.ogv"),
	preload("res://ogv/indiaoffice_libtheora.ogv"),
	preload("res://ogv/bitsbytescomp_libtheora.ogv"),
	preload("res://ogv/shutocar_libtheora.ogv"),
	preload("res://ogv/stevetaylor_libtheora.ogv"),
	preload("res://ogv/bldgcrane_libtheora.ogv"),
	preload("res://ogv/bitsbytescomp_libtheora.ogv"),
	preload("res://ogv/domefall2_libtheora.ogv"),
	preload("res://ogv/wave_libtheora.ogv"),
	preload("res://ogv/bldgclouds_libtheora.ogv"),
	preload("res://ogv/bitsbytesgfx_libtheora.ogv"),
	preload("res://ogv/hifive_libtheora.ogv"),
	preload("res://ogv/bitsbytesman_libtheora.ogv"),
	preload("res://ogv/mysterycomputer_libtheora.ogv"),
	preload("res://ogv/shuto_libtheora.ogv"),
	preload("res://ogv/bitsbytescomp_libtheora.ogv"),
	preload("res://ogv/wave_sunset_libtheora.ogv"),
	preload("res://ogv/sunsetboat_libtheora.ogv"),
	preload("res://ogv/domeroof_libtheora.ogv"),
	preload("res://ogv/mysteryoffice_libtheora.ogv"),
	preload("res://ogv/dayboat_libtheora.ogv"),
	preload("res://ogv/awards_libtheora.ogv"),
	preload("res://ogv/plammall2_libtheora.ogv"),
	preload("res://ogv/cloud_libtheora.ogv"),
	preload("res://ogv/glider_libtheora.ogv"),
	preload("res://ogv/lalandscape_libtheora.ogv"),
]


func play(index):
	$VideoPlayer.stream = ogv_resources[index]
	$VideoPlayer.play()


func _on_VideoPlayer_finished():
	$VideoPlayer.play()
