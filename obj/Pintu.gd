extends StaticBody2D


@onready var i = 0

func _process(_delta):
	if State.pintuDungeon == true and i == 0:
		open()

func open():
	SoundFx.getItem()
	$close.queue_free()
	$Collisionclose.queue_free()
	i = 1
