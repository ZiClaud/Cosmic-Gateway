extends Node2D
# Spawn every enemy every second

const METEOR_SCENE = preload("res://enemies/meteors/meteor_big.tscn")
const INDESTRUCTIBLE_METEOR_SCENE = preload("res://enemies/meteors/meteor_indescructible.tscn")
const ENEMY_SCENE = preload("res://enemies/enemy.tscn")
const BOSS_SCENE = preload("res://enemies/boss.tscn")

@export var start_time: float = 3.0
@export var min_spawn_time: float = 0.5
@export var speedup_after: int = 5
@export var speedup_of: float = 0.5

@onready var timer:Timer = $Timer

var curr_times: int = 0
var stage1: bool = false
var stage2: bool = false


func _ready():
	timer.wait_time = start_time
	indistrucible_spawn()


func _spawn(scene: PackedScene):
	var new_entity = scene.instantiate()
	var viewport_height = get_viewport_rect().size.y
	new_entity.position = Vector2(-100, randi_range(0, viewport_height))
	call_deferred("add_child", new_entity)


func spawn_meteor():
	_spawn(METEOR_SCENE)


func spawn_enemy():
	_spawn(ENEMY_SCENE)


func _spawn_boss():
	_spawn(BOSS_SCENE)


func spawn_boss():
	if (CurrGame.getScore() > 1000 && !stage1):
		print("Stage 1!")
		_spawn_boss()
		stage1=true
	elif (CurrGame.getScore() > 3000 && !stage2):
		_spawn_boss()
		_spawn_boss()
		_spawn_boss()
		stage2=true


func _on_timer_timeout():
	if (CurrGame.getLevel() <= 2):
		spawn_meteor()
	elif (CurrGame.getLevel() == 3):
		spawn_enemy()
	else:
		spawn_meteor()
		spawn_enemy()
		spawn_boss()
	
	curr_times += 1
	if curr_times > speedup_after:
		curr_times = 0
		if timer.get_wait_time() > min_spawn_time:
			timer.set_wait_time(timer.get_wait_time() - speedup_of)


func indistrucible_spawn():
	if CurrGame.getLevel() >= 2:
		_spawn(INDESTRUCTIBLE_METEOR_SCENE)
	if CurrGame.getLevel() >= 3:
		_spawn(INDESTRUCTIBLE_METEOR_SCENE)
