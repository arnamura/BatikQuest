extends StaticBody2D

@onready var anim = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	anim.play("idle")
