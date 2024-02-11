extends Node2D

@export var speed: int = 400;

func _process(delta):
	self.position.y -= speed * delta  # writing self.position is the same as writing position


func _on_area_entered(collider_area):
	# If it hit an enemy
	if collider_area.is_in_group("enemy"):
		self.queue_free()
