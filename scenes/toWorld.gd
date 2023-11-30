extends Area2D

@onready var effect = $"../../Effect"

func _on_body_entered(body):
	if body.name == "Player":
		effect.play("transisiOut")
		await effect.animation_finished
		DoorHandle.changeStage(DoorHandle.MainWorld)
		State.dungeonState = false
