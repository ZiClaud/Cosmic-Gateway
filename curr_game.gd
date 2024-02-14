extends Node

var _level:int
var _score:int
var _score_needed:int
var _player_pos:Vector2

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
	get_tree().change_scene_to_file("res://game.tscn")


func endGame():
	if didWin():
		LevelSelection.unlockLevel(_level + 1)
		startLevel(_level + 1)
	else:
		get_tree().change_scene_to_file("res://control.tscn")


func quitGame():
	get_tree().quit()


func getLevel():
	return _level


func didWin():
	if (_score > _score_needed):
		return true
	return false


func increaseScore(score:int):
	_score += score


func getScore():
	return _score


func getScoreNeeded():
	return _score_needed


func setPlayerPos(position:Vector2):
	_player_pos = position


func getPlayerPos():
	return _player_pos
