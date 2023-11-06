extends Node2D
@onready var effect = $Effect

# Called when the node enters the scene tree for the first time.
func _ready():
	effect.play("transisiIn")

