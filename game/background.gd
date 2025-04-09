extends Node2D

func _ready():
	var bg1:Node2D = $BG1TileMap
	var bg2:Node2D = $BG2TileMap
	var bg3:Node2D = $BG3TileMap
	var bg4:Node2D = $BG4TileMap
	
	if CurrGame.getLevel() == 1:
		bg1.visible = true
		bg2.visible = false
		bg3.visible = false
		bg4.visible = false
	elif CurrGame.getLevel() == 2:
		bg1.visible = true
		bg2.visible = true
		bg3.visible = false
		bg4.visible = false
	elif CurrGame.getLevel() == 3:
		bg1.visible = true
		bg2.visible = true
		bg3.visible = true
		bg4.visible = false
	elif CurrGame.getLevel() == 4:
		bg1.visible = true
		bg2.visible = true
		bg3.visible = true
		bg4.visible = true
		
