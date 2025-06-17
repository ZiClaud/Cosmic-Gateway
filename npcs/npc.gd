extends Node2D

@export var skin_changer: bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	if (skin_changer):
		Utils.skin_selector([$SkinSprite1, $SkinSprite2, $SkinSprite3, $SkinSprite4])


func _on_area_2d_area_entered(area):
	self.visible = false
