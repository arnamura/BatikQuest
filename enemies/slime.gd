extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@export var endPoint : Marker2D

@onready var animations = $AnimatedSprite2D
var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
	
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
		
	velocity = moveDirection.normalized()*speed
	
func updateAnimation():
	var animationString = "walkUp"
	if velocity.y > 0 : animationString = "walkDown"
	elif velocity.x < 0 : animationString = "walkLeft"
	elif velocity.x > 0 : animationString = "walkRight"
		
	animations.play(animationString)
	
func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
