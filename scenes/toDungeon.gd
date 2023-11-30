extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		if State.takenQuest3 == true:
			DoorHandle.changeStage(DoorHandle.Dungeon)
			State.dungeonState = true
