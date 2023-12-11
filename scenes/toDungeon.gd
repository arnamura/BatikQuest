extends Area2D
@onready var anim = $"../../../Effect"
func _on_body_entered(body):
	if body.name == "Player":
		if State.takenQuest3 == true:
			anim.play("transisiOut")
			DoorHandle.changeStage(DoorHandle.Dungeon)
			State.dungeonState = true
