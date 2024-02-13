extends Node2D

@export var bg:Node2D

@onready var lvl2bt:Button = $Control/Lvl2Button
@onready var lvl3bt:Button = $Control/Lvl3Button
@onready var lvl4bt:Button = $Control/Lvl4Button

func _ready():
	var unlocked_levels:int = LevelSelection.getUnlockedLevels()
	if unlocked_levels < 2:
		pass
	elif unlocked_levels < 3:
		lvl2bt.disabled = false
	elif unlocked_levels < 4:
		lvl2bt.disabled = false
		lvl3bt.disabled = false
	elif unlocked_levels < 5:
		lvl2bt.disabled = false
		lvl3bt.disabled = false
		lvl4bt.disabled = false


func _on_quit_button_pressed():
	get_tree().quit()


func _on_lvl_1_button_pressed():
	CurrGame.startLevel(1)
	get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_2_button_pressed():
	CurrGame.startLevel(2)	
	get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_3_button_pressed():
	CurrGame.startLevel(3)
	get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_4_button_pressed():
	CurrGame.startLevel(4)
	get_tree().change_scene_to_file("res://game.tscn")

