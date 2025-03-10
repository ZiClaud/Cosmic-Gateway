extends CharacterBody2D

@export var laser_tscn: PackedScene

# Default movement
@export var SPEED:int = 400
# Fun movement
@export var ACCEL:int = 15000
@export var FRICTION:int = 10

var input:Vector2 = Vector2.ZERO

var beanRight:Node2D
var beanLeft:Node2D
var beanUp:Node2D
var beanDown:Node2D

func _ready():
	beanRight = $Beans/BeamRight
	beanLeft = $Beans/BeamLeft
	beanUp = $Beans/BeamUp
	beanDown = $Beans/BeamDown
	var len_x:int = get_viewport_rect().size.x
	var len_y:int = get_viewport_rect().size.y
	self.position.x = len_x / 2
	self.position.y = len_y / 2
	
	Utils.skin_selector([$SkinSprite1, $SkinSprite2, $SkinSprite3, $SkinSprite4])


func _physics_process(delta):
	player_movement(delta)
	spawn_laser()
	CurrGame.setPlayerPos(self.position)
	Utils.teleport(self)


func show_beans(val:Vector2):
	if val.x > 0:
		beanRight.visible = false
		beanLeft.visible = true
	elif val.x < 0:
		beanRight.visible = true
		beanLeft.visible = false
	
	if val.y > 0:
		beanDown.visible = false
		beanUp.visible = true
	elif val.y < 0:
		beanDown.visible = true
		beanUp.visible = false


func get_input():
	input.x = int(Input.is_action_just_pressed("ui_right")) - int(Input.is_action_just_pressed("ui_left"))
	input.y = int(Input.is_action_just_pressed("ui_down")) - int(Input.is_action_just_pressed("ui_up"))

	input = input.normalized()
	show_beans(input)
	return input


func movement_fun(delta):
	input = get_input()
	if input == Vector2.ZERO:
		if self.velocity.length() > (FRICTION * delta):
			self.velocity -= self.velocity.normalized() * (FRICTION * delta)
		else:
			self.velocity = Vector2.ZERO
	else:
		self.velocity += (input * ACCEL * delta)
	
	move_and_slide()


func movement_default(delta):
	self.velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * SPEED
	move_and_slide()


func player_movement(delta):
	if Utils.is_movement_default():
		movement_default(delta)
	else:
		movement_fun(delta)


func spawn_laser():
	if Input.is_action_just_pressed("ui_accept"):
		var new_laser = laser_tscn.instantiate()
		new_laser.position = self.position
		self.add_sibling(new_laser)


func _on_area_entered(collider_area):
	if collider_area.is_in_group("enemy"):
		self.queue_free()


func _on_area_2d_area_entered(collider_area):
	if collider_area.is_in_group("enemy"):
		self.queue_free()
		CurrGame._score = 0
		CurrGame.endGame()
