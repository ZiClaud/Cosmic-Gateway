extends Label


func _process(delta):
	if (CurrGame.getScore() <= CurrGame.getScoreNeeded()):
		self.text = "Score: " + str(CurrGame.getScore()) + "/" + str(CurrGame.getScoreNeeded())
	elif (CurrGame.getLevel() != 4):
		self.text = "Next level unlocked - " + "Score: " + str(CurrGame.getScore())
	else:
		self.text = "Congrats, you won! - "  + "Score: " + str(CurrGame.getScore())

