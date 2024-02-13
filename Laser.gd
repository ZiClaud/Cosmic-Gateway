extends Node2D

@export var min_speed:int = 400

var speedX:float = 0
var speedY:float = 0

var directionX: int = 1
var directionY: int = 1

func _ready():
	var mouse_pos = get_global_mouse_position() 
	speedX = -mouse_pos.x + self.position.x
	speedY = -mouse_pos.y + self.position.y
	
	if (speedX < 0):
		directionX = -1
	if (speedY < 0):
		directionY = -1
	
	speedup_laser()


func speedup_laser():
	while speedX * directionX + speedY * directionY < min_speed:
		speedX *= 1.1
		speedY *= 1.1


func _process(delta):
	self.position.x -= speedX * delta
	self.position.y -= speedY * delta

func _on_area_entered(collider_area):
	# If it hit an enemy
	if collider_area.is_in_group("enemy"):
		self.queue_free()
