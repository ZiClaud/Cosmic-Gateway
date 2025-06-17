extends Node2D

const SCREEN:PackedScene = preload("res://ui/screen.tscn")

var seconds_passed:int = 0
var npcs = []

func _ready():
	npcs = [$NPC, $NPC2, $NPC3, $NPC4, $NPC5, $NPC6, $NPC7, $NPC8, $NPC9, $NPC10, $NPC11, $NPC12, $NPC13, $NPC14, $NPC15, $NPC16, $NPC17, $Pink, $Yellow]


func _process(delta):
	_move_all_npcs(delta)


func _on_timer_timeout():
	if (seconds_passed >= 11):
		get_tree().change_scene_to_packed(SCREEN)
	
	seconds_passed += 1


func _move_all_npcs(delta):
	for npc in npcs:
		npc.position.y += 100 * delta
