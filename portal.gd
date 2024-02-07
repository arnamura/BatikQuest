extends Node2D

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	visible = false

func _on_active_area_body_entered(body):
	if body.name == "Player":
		visible = true
		anim.play("open")
		await anim.animation_finished
		anim.play("idle")


func _on_active_area_body_exited(body):
	if body.name == "Player":
		anim.play("close")
		await anim.animation_finished
		anim.stop()
		visible = false


