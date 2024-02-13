extends Node2D

@export var max_speed: int = 200
@export var score: int = 20
@export var destroyed_tscn: PackedScene

var speed:Vector2

func _ready():
	var rand_x:int = randi_range(-max_speed, max_speed)
	var rand_y:int = randi_range(-max_speed, max_speed)
	speed.x = rand_x
	speed.y = rand_y


func _process(delta):
	self.position.x += speed.x * delta
	self.position.y += speed.y * delta
	Utils.teleport(self)


func _on_area_entered(area):
	# Destroy meteor
	self.queue_free()
	CurrGame.increaseScore(score)
	if destroyed_tscn != null:
		spawn_meteor(20)
		spawn_meteor(-20)


func spawn_meteor(val:int):
	var new_meteor = destroyed_tscn.instantiate()
	new_meteor.position.x = self.position.x + val
	new_meteor.position.y = self.position.y + val
	
	self.add_sibling(new_meteor)
