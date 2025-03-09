extends Node2D

var _movement_default: bool = true


func is_movement_default() -> bool:
	return _movement_default


func toggle_movement_default() -> void:
	_movement_default = !_movement_default


func teleport(node:Node2D):
	var viewport_x:int = get_viewport_rect().size.x
	var viewport_y:int = get_viewport_rect().size.y
	if (node.position.x > viewport_x + 10):
		node.position.x = -10
	if (node.position.x < -10):
		node.position.x = viewport_x + 10
	if (node.position.y > viewport_y + 10):
		node.position.y = 10
	if (node.position.y < -10):
		node.position.y = viewport_y + 10


func get_rotation_from_position(pos1: Vector2, pos2: Vector2) -> float:
	return (pos2-pos1).angle()


func apply_destroyed_effect(curr_node:Node2D, destroyed_effect_tscn: PackedScene) -> void:
	var effect:Node = destroyed_effect_tscn.instantiate()
	effect.position = curr_node.position
	
	curr_node.add_sibling(effect)


func skin_selector(skins:Array):
	for skin in skins:
		skin.visible = false
	
	skins.pick_random().visible = true

