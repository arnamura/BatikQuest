extends CharacterBody2D

@export var speed = 20

@onready var namaNpc: Label = $nama
@onready var animations = $AnimationPlayer
@onready var namaPosition = namaNpc.global_position.y

var active = false

func _ready():
	namaNpc.text = $".".name.capitalize()
		
func _physics_process(_delta):
	animations.play("idle")

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		namaNpc.visible = true
		$Area2D/Notice.visible = true
		
		#Fungsi agar nama ada animasi memantul
		var namaAfterTween: int = namaPosition - 15
		create_tween().tween_property(namaNpc, "global_position:y", namaAfterTween, 0.5).from(namaPosition).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
		$Area2D/Notice/AnimationPlayer.play('standby')

func _on_area_2d_body_exited(body):
	if body.name == 'Player':
		namaNpc.visible = false
		$Area2D/Notice.visible = false
		
