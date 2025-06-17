extends Node

const GAME_SCENE = preload("res://game/game.tscn")
const SCREEN_SCENE = preload("res://ui/screen.tscn")

var _level:int
var _score:int
var _high_score:int = 0
var _score_needed:int = -1
var _player_pos:Vector2
var _boss_hp:int = 0

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
	get_tree().change_scene_to_packed(GAME_SCENE)


func endGame():
	setBossHp(0)
	if didWin():
		LevelSelection.unlockLevel(_level + 1)
		startLevel(_level + 1)
	else:
		get_tree().change_scene_to_packed(SCREEN_SCENE)


func quitGame() -> void:
	get_tree().quit()


func getLevel() -> int:
	return _level


func didWin() -> bool:
	if (_score >= _score_needed):
		return true
	return false


func increaseScore(score:int) ->  void:
	_score += score
	_setHighScore()


func getScore() -> int:
	return _score


func getHighScore() -> int:
	return _high_score


func _setHighScore() -> void:
	if (_score > _high_score):
		_high_score = _score


func getScoreNeeded() -> int:
	return _score_needed


func setPlayerPos(position:Vector2) -> void:
	_player_pos = position


func getPlayerPos() -> Vector2:
	return _player_pos


func setBossHp(hp:int) -> void:
	_boss_hp = hp


func getBossHp() -> int:
	return _boss_hp

