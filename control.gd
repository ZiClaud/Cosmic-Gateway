extends Node2D



func _on_quit_button_pressed():
	get_tree().quit()


func _on_lvl_1_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_2_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 2:
		get_tree().change_scene_to_file("res://game.tscn")



func _on_lvl_3_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 3:
		get_tree().change_scene_to_file("res://game.tscn")


func _on_lvl_4_button_pressed():
	if LevelSelection.getUnlockedLevels() >= 4:
		get_tree().change_scene_to_file("res://game.tscn")
