extends Node2D

@export var speed:int = 100
@export var start_distance:int = -500


func _ready():
	self.position.x = get_viewport_rect().size.x / 2
	self.position.y = start_distance


func _process(delta):
	if CurrGame.didWin() && CurrGame.getLevel() < 4:
		self.position.y += speed * delta
	stop_at_distance()


func _on_area_2d_area_entered(collider_area):
	if collider_area.is_in_group("player"):
		CurrGame.endGame()


func stop_at_distance():
	if self.position.y > get_viewport_rect().size.y:
		self.position.y = get_viewport_rect().size.y
