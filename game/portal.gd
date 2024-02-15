extends Node2D

@export var speed:int = 100
@export var start_distance:int = -100

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	self.position.x = get_viewport_rect().size.x / 2
	self.position.y = start_distance
	if CurrGame.getLevel() > 3:
		self.queue_free()


func _process(delta):
	if CurrGame.didWin():
		self.position.y += speed * delta
	stop_at_distance()


func _on_area_2d_area_entered(collider_area):
	audio.play()
	if collider_area.is_in_group("player"):
		CurrGame.endGame()


func stop_at_distance():
	if self.position.y > get_viewport_rect().size.y:
		self.position.y = get_viewport_rect().size.y
