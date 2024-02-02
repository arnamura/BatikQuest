extends "res://obj/item.gd"
@onready var anim = $AnimationPlayer
func _process(_delta):
	anim.play("idle")
	ambil()
	
func ambil():
	if State.kunciDungeon == true:
		super.collect()
