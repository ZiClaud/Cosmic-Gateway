extends Node2D

var timer:Timer

func _ready():
	timer = $Timer


func _on_timer_timeout():
	self.visible = false


func _on_visibility_changed():
	timer.start()
