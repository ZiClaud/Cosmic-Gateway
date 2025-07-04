extends Node2D

@export var min_speed:int = 600

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

var speedX:float = 0
var speedY:float = 0

var directionX: int = 1
var directionY: int = 1


func _ready():
	var player_pos = $"../Pink".position
	speedX = -player_pos.x + self.position.x
	speedY = -player_pos.y + self.position.y
	
	if (speedX < 0):
		directionX = -1
	if (speedY < 0):
		directionY = -1
	
	speedup_laser()
	rotate_sprite(player_pos)
	audio.play()


func rotate_sprite(player_pos:Vector2):
	self.rotation = Utils.get_rotation_from_position(self.position, player_pos)


func speedup_laser():
	while speedX * directionX + speedY * directionY < min_speed:
		speedX *= 1.1
		speedY *= 1.1


func _process(delta):
	self.position.x -= speedX * delta
	self.position.y -= speedY * delta


func _on_area_entered(collider_area):
	if !collider_area.is_in_group("enemy_ship"):
		self.queue_free()
