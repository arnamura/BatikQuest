extends Node2D

@onready var anim = $Effect
@onready var tpTime = $Timer
@onready var item = State.questInfo
@onready var ui = $MainUI
@onready var player = $TileMap/Player
@onready var cinematic = $Cutscene


func _ready():
	anim.play("transisiIn")
	if not State.introQuest: #untuk mengaktifkan quest intro saat game baru dimulai
		State.takenQuest0 = true
	cutscene()
func _process(delta):
	if not State.introQuest: #untuk mengecek kondisi quest supaya bisa berpindah ke main world
		if State.questInfo[0]["item"] == "1":
			State.introQuest = true
			teleport()
		
func teleport(): #fungsi untuk berpindah ke main world
	ui.visible = false
	$MainUI/Dpads.visible = false
	anim.play("transisiOut")
	await anim.animation_finished
	anim.stop()
	DoorHandle.changeStage(DoorHandle.MainWorld)
 
func cutscene():
	if State.takenQuest0 == false:
		pass
	else:
		player.isCinematic = true
		cinematic.play("intro_quest")
		await cinematic.animation_finished
		player.isCinematic = false
