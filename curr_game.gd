extends Node

var _level:int
var _score:int
var _score_needed:int

func startLevel(lvl:int):
	_level = lvl
	_score = 0
	if (_level == 1):
		_score_needed = 100
	elif (_level == 2):
		_score_needed = 300
	elif (_level == 3):
		_score_needed = 500
	elif (_level == 4):
		_score_needed = 1000
	


func getLevel():
	return _level


func didWin():
	if (_score > _score_needed):
		return true
	return false


func increaseScore(score:int):
	_score += score
	if didWin():
		LevelSelection.unlockLevel(_level + 1)


func getScore():
	return _score


func getScoreNeeded():
	return _score_needed

