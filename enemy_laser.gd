extends Node2D

@export var min_speed:int = 600

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

var speedX:float = 0
var speedY:float = 0

var directionX: int = 1
var directionY: int = 1


func _ready(): # TODO: Fix this
	var mouse_pos = get_global_mouse_position() 
	speedX = -mouse_pos.x + self.position.x
	speedY = -mouse_pos.y + self.position.y
	
	if (speedX < 0):
		directionX = -1
	if (speedY < 0):
		directionY = -1
	
	speedup_laser()
	audio.play()


func rotate_sprite(): # TODO: To call on _ready()
	pass


func speedup_laser():
	pass


func _process(delta):
	self.position.x -= speedX * delta
	self.position.y -= speedY * delta


func _on_area_entered(collider_area):
	self.queue_free()
