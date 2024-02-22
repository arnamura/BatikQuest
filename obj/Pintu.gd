extends StaticBody2D


@onready var i = 0

func _process(_delta):
	if State.pintuDungeon == true and i == 0:
		open()

func open():
	$close.queue_free()
	$Collisionclose.queue_free()
	$Actionable.queue_free()
	i = 1
