extends Node

var _unlocked_levels:int = 1

func reset_values():
	_unlocked_levels = 0

func unlockLevel(level:int):
	_unlocked_levels = level

func getUnlockedLevels():
	return _unlocked_levels
