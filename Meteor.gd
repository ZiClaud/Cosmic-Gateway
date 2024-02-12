extends Node2D

@export var max_speed: int = 200
@export var score: int = 10

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
	# TODO: create 2/3 smaller meteors
