extends Node2D

@export var enemy_laser_tscn: PackedScene
@export var destroyed_effect_tscn: PackedScene

@export var max_speed: int = 200
@export var score: int = 50

var speed:Vector2

func _ready():
	var rand_x:int = randi_range(-max_speed, max_speed)
	var rand_y:int = randi_range(-max_speed, max_speed)
	speed.x = rand_x
	speed.y = rand_y
	
	skin_selector()

func skin_selector():
	var rand_skin:int = randi_range(1, 5)
	var curr_skin:Sprite2D
	
	curr_skin = $SkinSprite1
	curr_skin.visible = false
	
	if (rand_skin == 1):
		curr_skin = $SkinSprite1
		curr_skin.visible = true
	elif (rand_skin == 2):
		curr_skin = $SkinSprite2
		curr_skin.visible = true
	elif (rand_skin == 3):
		curr_skin = $SkinSprite3
		curr_skin.visible = true
	elif (rand_skin == 4):
		curr_skin = $SkinSprite4
		curr_skin.visible = true
	elif (rand_skin == 5):
		curr_skin = $SkinSprite5
		curr_skin.visible = true

func _process(delta):
	ai(delta)
	face_player()
	Utils.teleport(self)


func _on_area_entered(collider_area):
	# Destroy ship
	if !collider_area.is_in_group("enemy_laser"):
		Utils.apply_destroyed_effect(self, destroyed_effect_tscn)
		CurrGame.increaseScore(score)
		self.queue_free()


func ai(delta): # TODO: Maybe improve
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

