extends Node2D

const SCREEN:PackedScene = preload("res://ui/screen.tscn")

var seconds_passed:int = 0
@onready var portal = $Portal


func _ready():
	var NPC = $NPC
	var PINK = $Pink
	var BOSS = $Boss
	var PROTAL = $Portal


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_move_portal(delta)


func _move_portal(delta):
	portal.position.y += 100 * delta


func _on_timer_timeout():
	
	
	
	if (seconds_passed >= 3):
		get_tree().change_scene_to_packed(SCREEN)
	
	seconds_passed += 1
