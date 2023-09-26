extends "res://obj/item.gd"

@onready var anim = $AnimationPlayer

func _process(_delta):
	anim.play("idle")
	ambil()

#func collect():
#	anim.stop()
#	State.reqItem2 = "1"
#	#memanggil funct pada root class
#	super.collect()

func ambil():
	if State.reqItem2 == "1":
		super.collect()
