extends Node2D
@onready var anim = $Effect


func _ready():
	anim.play("transisiIn")


