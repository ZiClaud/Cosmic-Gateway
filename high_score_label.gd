extends Label


func _ready():
	self.text = "High Score: " + str(CurrGame.getHighScore())
	if CurrGame.getHighScore() == 0:
		self.visible = false

