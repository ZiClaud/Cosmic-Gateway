extends ColorRect

@export var appear_time_sec:int
@export var duration_time_sec:int = 1

@export var bubble_img:String
@export var bubble_text:String
@export var bubble_width:int = 0
@export var bubble_height:int = 0

@export var IS_PINK:bool = false
@export var IS_YELLOW:bool = false
@export var IS_BLUE:bool = false

var curr_sec: int = -1

var img_ufo_yellow = preload("res://assets/PNG/ufoYellow.png")

func _ready():
	self.visible = false

	$BubbleDialogLabel.text = bubble_text
	
	if (IS_PINK):
		self.color = Color.PINK
	elif (IS_YELLOW):
		self.color = Color.YELLOW
	elif (IS_BLUE):
		self.color = Color.SKY_BLUE
	else:
		self.color = Color.WEB_GRAY



func _on_timer_timeout():
	if (appear_time_sec <= curr_sec and curr_sec <= appear_time_sec + duration_time_sec):
		self.visible = true
	else:
		self.visible = false
		
	curr_sec += 1
