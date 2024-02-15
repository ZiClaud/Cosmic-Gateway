extends Label


func _process(delta):
	if (CurrGame.getBossHp() > 0):
		self.text = "Boss: " + str(CurrGame.getBossHp() * 10) + "/100"
	else:
		self.text = ""

