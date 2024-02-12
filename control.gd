extends Node2D

@export var bg:Node2D

func _on_quit_button_pressed():
	get_tree().quit()


func _on_lvl_1_button_pressed():
	CurrGame.startLevel(1)
	get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_2_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 2:
		CurrGame.startLevel(2)
		get_tree().change_scene_to_file("res://game.tscn")



func _on_lvl_3_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 3:
		CurrGame.startLevel(3)
		get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_4_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 4:
		CurrGame.startLevel(4)
		get_tree().change_scene_to_file("res://game.tscn")
