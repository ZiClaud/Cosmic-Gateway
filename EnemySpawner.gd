extends Node2D
# Spawn every enemy every second

@export var enemy_tscn: PackedScene
@export var start_time: float = 3.0
@export var min_spawn_time: float = 0.5
@export var speedup_after: int = 5
@export var speedup_of: float = 0.5

@onready var timer:Timer = $Timer

var curr_times: int = 0

func _ready():
	timer.wait_time = start_time


func spawn_enemy():
	var new_enemy = enemy_tscn.instantiate()
	
	var viewport_height:int = get_viewport_rect().size.y
	var rand_y:int = randi_range(0, viewport_height)
	new_enemy.position.x = -100
	new_enemy.position.y = rand_y
	
	self.add_child(new_enemy)


func _on_timer_timeout():
	spawn_enemy()
	curr_times += 1
	if curr_times > speedup_after:
		curr_times = 0
		if timer.get_wait_time() > min_spawn_time:
			timer.set_wait_time(timer.get_wait_time() - speedup_of)
