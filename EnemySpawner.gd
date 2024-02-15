extends Node2D
# Spawn every enemy every second

@export var meteor_tscn: PackedScene
@export var ind_meteor_tscn: PackedScene
@export var enemy_tscn: PackedScene
@export var boss_tscn: PackedScene
@export var start_time: float = 3.0
@export var min_spawn_time: float = 0.5
@export var speedup_after: int = 5
@export var speedup_of: float = 0.5

@onready var timer:Timer = $Timer

var curr_times: int = 0

func _ready():
	timer.wait_time = start_time
	indistrucible_spawn()

func spawn_meteor():
	var new_meteor = meteor_tscn.instantiate()
	
	var viewport_height:int = get_viewport_rect().size.y
	var rand_y:int = randi_range(0, viewport_height)
	new_meteor.position.x = -100
	new_meteor.position.y = rand_y
	
	self.add_child(new_meteor)


func spawn_enemy():
	var new_enemy = enemy_tscn.instantiate()
	
	var viewport_height:int = get_viewport_rect().size.y
	var rand_y:int = randi_range(0, viewport_height)
	new_enemy.position.x = -100
	new_enemy.position.y = rand_y
	
	self.add_child(new_enemy)


func _on_timer_timeout():
	if (CurrGame.getLevel() <= 2):
		spawn_meteor()
	elif (CurrGame.getLevel() == 3):
		spawn_enemy()
	else:
		spawn_meteor()
		spawn_enemy()
	
	curr_times += 1
	if curr_times > speedup_after:
		curr_times = 0
		if timer.get_wait_time() > min_spawn_time:
			timer.set_wait_time(timer.get_wait_time() - speedup_of)


func indistrucible_spawn():
	var new_meteor1 = ind_meteor_tscn.instantiate()
	var new_meteor2 = ind_meteor_tscn.instantiate()
	
	var viewport_height:int = get_viewport_rect().size.y
	new_meteor1.position.x = -100
	new_meteor1.position.y = randi_range(0, viewport_height)
	new_meteor2.position.x = -100
	new_meteor2.position.y = randi_range(0, viewport_height)
	
	if (CurrGame.getLevel() == 2):
		self.add_child(new_meteor1)
	elif (CurrGame.getLevel() == 3):
		self.add_child(new_meteor1)
		self.add_child(new_meteor2)
	elif (CurrGame.getLevel() == 4):
		self.add_child(new_meteor1)
		self.add_child(new_meteor2)
