extends CharacterBody2D

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("RESET")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		anim.play("idle")
	else:
		anim.play("RESET")
