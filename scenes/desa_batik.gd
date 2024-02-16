extends Node2D

@onready var anim = $Effect
@onready var player = $TileMap/Player
@onready var spawnFromDungeon = $TileMap/Helpers/SpawnFromDungeon



func _ready():
	anim.play("transisiIn")

func _process(_delta):
	if State.dungeonState == true:
		player.position = spawnFromDungeon.position
		#player.position = spawnFromDungeon.global_positions
		State.dungeonState = false
	else:
		pass
		
	if State.bossPass == true:
		anim.play("bossPass")
		State.bossPass = false
	
	if State.quest8Status == true:
		anim.play("gatekeep")
		



func _on_teleport_area_body_entered(body):
	if body.name == "Player":
		anim.play("transisiOut")
		await anim.animation_finished
		DoorHandle.changeStage(DoorHandle.museum)
