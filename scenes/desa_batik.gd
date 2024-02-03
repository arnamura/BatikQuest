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
		

