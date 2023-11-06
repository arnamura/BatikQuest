extends Node2D

@onready var effect = $Effect
@onready var player = $TileMap/Player

var onTrans = false

func _ready():
	effect.play("transisiIn")
	
func _physics_process (_delta):
	if player.hp == 0:
		if not onTrans:
			respawn()
	
func respawn():
	onTrans = true
	transAnim()
	player.respawn()
	
func transAnim():
	effect.play("transisiOut")
	await effect.animation_finished
	effect.play("transisiIn")
	await effect.animation_finished
	onTrans = false
	
	
