extends Area2D

@onready var anim = $"../../Effect"

func _on_body_entered(body):
	if body.name == "Player":
		anim.play("transisiOut")
		await anim.animation_finished
		DoorHandle.changeStage(DoorHandle.DesaBatik)
		
