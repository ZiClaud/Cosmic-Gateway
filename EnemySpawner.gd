extends Node2D
# Spawn every enemy every second

@export var enemy_tscn: PackedScene

func spawn_enemy():
	var new_enemy = enemy_tscn.instantiate()
	
	var viewport_height:int = get_viewport_rect().size.y
	var rand_y:int = randi_range(0, viewport_height)
	new_enemy.position.x = -100
	new_enemy.position.y = rand_y
	
	self.add_child(new_enemy)


func _on_timer_timeout():
	spawn_enemy()
