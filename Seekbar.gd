extends Node2D

var total_time = 0
var current_time = 0

func start(total_time):
	$PauseSprite.visible = true
	self.total_time = total_time
	updateLabel()
	$Timer.one_shot = false
	$Timer.start()

func updateTime():
	current_time += 1
	updateLabel()
	updateProgress()

func reset():
	current_time = 0
	$ProgressSprite.scale.x = 0

func updateLabel():
	$Label.text = "%d:%02d / %d:%02d" % [current_time / 60, current_time % 60, total_time / 60, total_time % 60]

func updateProgress():
	$ProgressSprite.scale.x = float(current_time) / total_time

func _on_Timer_timeout():
	if current_time >= total_time:
		$Timer.one_shot = true
	else:
		updateTime()
	
