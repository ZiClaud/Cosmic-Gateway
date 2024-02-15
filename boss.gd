extends Node2D

@export var enemy_laser_tscn: PackedScene
@export var destroyed_effect_tscn: PackedScene

@export var max_speed: int = 200
@export var score: int = 500
@export var hp: int = 10

var speed:Vector2

func _ready():
	var rand_x:int = randi_range(-max_speed, max_speed)
	var rand_y:int = randi_range(-max_speed, max_speed)
	speed.x = rand_x
	speed.y = rand_y
	
	Utils.skin_selector([$SkinSprite1, $SkinSprite2, $SkinSprite3, $SkinSprite4])
	CurrGame.setBossHp(hp)


func _process(delta):
	ai(delta)
	face_player()
	Utils.teleport(self)


func _on_area_entered(collider_area):
	# Destroy ship
	if collider_area.is_in_group("player_laser"):
		if (hp <= 0):
			Utils.apply_destroyed_effect(self, destroyed_effect_tscn)
			CurrGame.increaseScore(score)
			self.queue_free()
		else:
			hp -= 1
		CurrGame.setBossHp(hp)


func ai(delta):
	self.position.x += speed.x * delta
	self.position.y += speed.y * delta


func face_player():
	self.rotation = Utils.get_rotation_from_position(self.position, CurrGame.getPlayerPos())


func shoot_laser():
	var new_laser = enemy_laser_tscn.instantiate()
	new_laser.position = self.position
	
	self.add_sibling(new_laser)


func _on_timer_timeout():
	shoot_laser()

