extends Node2D

@onready var anim = $Effect
@onready var tpTime = $Timer
@onready var item = State.questInfo
@onready var ui = $MainUI

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("transisiIn")
	if not State.introQuest:
		State.takenQuest0 = true

func _process(delta):
	if not State.introQuest:
		if State.questInfo[0]["item"] == "1":
			State.introQuest = true
			print_debug(State.introQuest)
			teleport()
		
func teleport():
	ui.visible = false
	$MainUI/Dpads.visible = false
	anim.play("transisiOut")
	await anim.animation_finished
	anim.stop()
	DoorHandle.changeStage(DoorHandle.MainWorld)
