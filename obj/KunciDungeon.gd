extends "res://obj/item.gd"

func _process(delta):
	ambil()
	
func ambil():
	if State.kunciDungeon == true:
		super.collect()
