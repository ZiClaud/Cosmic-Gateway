extends Label


func _process(delta):
	if (CurrGame.getScore() <= CurrGame.getScoreNeeded()):
		self.text = "Score: " + str(CurrGame.getScore()) + "/" + str(CurrGame.getScoreNeeded())
	else:
		self.text = "Score: " + str(CurrGame.getScore())

