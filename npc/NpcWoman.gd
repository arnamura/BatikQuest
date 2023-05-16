extends Area2D

func _physics_process(_delta):
	$NPC/AnimationPlayer.play("idle")

func _on_body_entered(body):
	if body.name == 'Player':
		$Notice.visible = true
		$Notice/AnimationPlayer.play('standby')

func _on_body_exited(body):
	if body.name == 'Player':
		$Notice.visible = false
		
