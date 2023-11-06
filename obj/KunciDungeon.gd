extends "res://obj/item.gd"

func _process(_delta):
	ambil()
	
func ambil():
	if State.kunciDungeon == true:
		super.collect()
