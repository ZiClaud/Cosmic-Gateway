extends Node

var _score:int = 0
var is_game_over:bool = false

func reset_values():
	_score = 0
	is_game_over = false

func increase_score(increase_amount:int):
	_score += increase_amount

func getScore():
	return _score
