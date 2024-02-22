extends "res://obj/item.gd"

@onready var anim = $AnimationPlayer
@onready var timer = $Timer
@onready var i = 1

func _ready():
	anim.play("idle")
	
func _process(_delta):
	if State.reqItem4 == "1" and i == 1:
		buka()

func buka():
	if i == 1:
		anim.stop()
		i = 2
		anim.play("open")
		await anim.animation_finished
		timer.start()
		await timer.timeout
		super.collect()
	
