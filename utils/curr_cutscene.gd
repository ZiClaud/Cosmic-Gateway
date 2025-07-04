extends Node

var _npc_pink_pos:Vector2
var _npc_player_pos:Vector2


func setNpcPlayerPos(position:Vector2) -> void:
	_npc_player_pos = position

func getNpcPlayerPos() -> Vector2:
	return _npc_player_pos


func setNpcPinkPos(position:Vector2) -> void:
	_npc_pink_pos = position

func getNpcPinkPos() -> Vector2:
	return _npc_pink_pos
