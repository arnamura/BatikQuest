extends CharacterBody2D

func _physics_process(_delta):
	$NPC/AnimationPlayer.play("idle")

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		$Area2D/Notice.visible = true
		$Area2D/Notice/AnimationPlayer.play('standby')

func _on_area_2d_body_exited(body):
	if body.name == 'Player':
			$Area2D/Notice.visible = false
