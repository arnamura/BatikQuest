extends CharacterBody2D

@export var speed = 20

@onready var animations = $AnimationPlayer

var active = false
		
func _physics_process(_delta):
	animations.play("idle")

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		$Area2D/Notice.visible = true
		$Area2D/Notice/AnimationPlayer.play('standby')

func _on_area_2d_body_exited(body):
	if body.name == 'Player':
		$Area2D/Notice.visible = false
		
