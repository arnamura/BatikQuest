extends Area2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"

const Balloon = preload("res://dialogue/small_balloon.tscn")
	
func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)


