extends "res://obj/item.gd"

@onready var anim = $AnimationPlayer
@onready var timer = $Timer
@onready var i = 1
func _process(_delta):
	if State.reqItem3 == "1" and i == 1:
		buka()

func buka():
	if i == 1:
		i = 2
		anim.play("open")
		timer.start()
		await anim.animation_finished
		super.collect()
	
