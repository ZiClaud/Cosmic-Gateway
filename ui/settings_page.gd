extends Control

@onready var movement_bt: Button = %MovementButton
@onready var unlock_container: HBoxContainer = %LevelsUnlockContainer


func update_movement_bt_text():
	if (Utils.is_movement_default()):
		movement_bt.text = "Default"
	else:
		movement_bt.text = "Fun"


func _ready():
	if LevelSelection.getUnlockedLevels() >= 4:
		unlock_container.visible = false
	update_movement_bt_text()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ui/screen.tscn")


func _on_movement_button_pressed():
	Utils.toggle_movement_default()
	update_movement_bt_text()


func _on_unlock_button_pressed():
	LevelSelection.unlockLevel(4)
	unlock_container.visible = false
