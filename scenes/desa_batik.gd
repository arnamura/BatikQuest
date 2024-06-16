extends Node2D

@onready var anim = $Effect
@onready var player = $TileMap/Player
@onready var spawnFromDungeon = $TileMap/Helpers/SpawnFromDungeon
@onready var ui = $MainUI

var i = true


func _ready():
	anim.play("transisiIn")
	await anim.animation_finished
	anim.play("RESET")
	$bgTransisi.visible = false
	i = true

func _process(_delta):
	if State.dungeonState == true:
		player.position = spawnFromDungeon.position
		#player.position = spawnFromDungeon.global_positions
		State.dungeonState = false
	else:
		pass
	if State.bossPass:
			anim.play("bossPass")
			State.bossPass = false
	if State.quest8Status or State.tamat:
		clearedBoss()
	if State.quest3Status == true and State.takenQuest7 == false and State.reqItem7 == "":
		quest7cutscene()

func _on_teleport_area_body_entered(body):
	if body.name == "Player":
		anim.play("transisiOut")
		await anim.animation_finished
		DoorHandle.changeStage(DoorHandle.museum)

func clearedBoss():
	if i == true :
		anim.play("gatekeep")
		i = false

func quest7cutscene():
	if State.takenQuest7:
		pass
	else:
		player.isCinematic = true
		anim.play("quest7cutscene")
		State.notMove = true
		await anim.animation_finished
		player.isCinematic = false
