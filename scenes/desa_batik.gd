extends Node2D

@onready var anim = $Effect
@onready var player = $TileMap/Player
@onready var spawnFromDungeon = $TileMap/Helpers/SpawnFromDungeon



func _ready():
	anim.play("transisiIn")

func _process(delta):
	if State.dungeonState == true:
		player.position = spawnFromDungeon.positions
		State.dungeonState = false
	else:
		pass
		

