extends Node2D

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

