extends ColorRect

@export var appear_time_sec:int
@export var duration_time_sec:int = 1

@export var bubble_text:String
@export var bubble_width:float = 1.0
@export var bubble_height:float = 1.0

@export var IS_PINK:bool = false
@export var IS_YELLOW:bool = false
@export var IS_BLUE:bool = false

var curr_sec: int = -1

func _ready():
	self.visible = false
	
	$BubbleDialogLabel.text = bubble_text
	
	# _set_bubble_size()
	
	_set_bubble_colour()



func _on_timer_timeout():
	if (appear_time_sec <= curr_sec and curr_sec <= appear_time_sec + duration_time_sec):
		self.visible = true
	else:
		self.visible = false
		
	curr_sec += 1


func _set_bubble_size():
	$ColorRect.position.x -= $ColorRect.size.x * bubble_width / 2
	$ColorRect.position.y -= $ColorRect.size.y * bubble_height / 2
	
	$ColorRect.size.x = $ColorRect.size.x * bubble_width
	$ColorRect.size.y = $ColorRect.size.y * bubble_height


func _set_bubble_colour():
	if (IS_PINK):
		$ColorRect.color = Color.PINK
	elif (IS_YELLOW):
		$ColorRect.color = Color.YELLOW
	elif (IS_BLUE):
		$ColorRect.color = Color.SKY_BLUE
	else:
		$ColorRect.color = Color.WEB_GRAY
