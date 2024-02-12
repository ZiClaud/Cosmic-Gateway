extends CharacterBody2D

@export var max_speed:int = 1400
@export var accel:int = 1500
@export var friction:int = 10

var input:Vector2 = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_just_pressed("ui_right")) - int(Input.is_action_just_pressed("ui_left"))
	input.y = int(Input.is_action_just_pressed("ui_down")) - int(Input.is_action_just_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	if input == Vector2.ZERO:
		if self.velocity.length() > (friction * delta):
			self.velocity -= self.velocity.normalized() * (friction * delta)
		else:
			self.velocity = Vector2.ZERO
	else:
		self.velocity += (input * accel * delta)
		self.velocity = self.velocity.limit_length(max_speed)
	
	move_and_slide()
