extends CharacterBody2D

@export var speed = 20

@onready var animations = $AnimationPlayer


		
func _physics_process(_delta):
	animations.play("idle")
	
	
