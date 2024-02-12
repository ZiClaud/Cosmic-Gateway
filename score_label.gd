extends Label


func _process(delta):
	self.text = "Score: " + str(CurrGame.getScore()) + "/" + str(CurrGame.getScoreNeeded())

