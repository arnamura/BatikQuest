extends CharacterBody2D

@export var speed = 20

@onready var namaNpc: Label = $nama
@onready var animations = $AnimationPlayer

var active = false

func _ready():
	namaNpc.text = $".".name.capitalize()
		
func _physics_process(_delta):
	animations.play("idle")

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		namaNpc.visible = true
		$Area2D/Notice.visible = true
		create_tween().tween_property(namaNpc, "global_position:y", 6, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
		$Area2D/Notice/AnimationPlayer.play('standby')

func _on_area_2d_body_exited(body):
	if body.name == 'Player':
		namaNpc.visible = false
		namaNpc.global_position.y = 15
		$Area2D/Notice.visible = false
		
