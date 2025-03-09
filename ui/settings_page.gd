extends Control

@onready var movement_bt: Button = %MovementButton


func update_movement_bt_text():
	if (Utils.is_movement_default()):
		movement_bt.text = "Default"
	else:
		movement_bt.text = "Fun"


func _ready():
	update_movement_bt_text()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ui/screen.tscn")


func _on_movement_button_pressed():
	Utils.toggle_movement_default()
	update_movement_bt_text()
