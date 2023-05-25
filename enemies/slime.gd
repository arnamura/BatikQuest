extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@export var endPoint : Marker2D
@export var slimeV = velocity


@onready var animations = $AnimationPlayer
var startPosition
var endPosition
var y = velocity
var pos

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
	if velocity.length() == 0:
		if  animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y <0: direction = "Up"
		animations.play("walk"+ direction)
	
func _physics_process(_delta):
	pos = get_position()
	updateVelocity()
	move_and_slide()
	updateAnimation()

func _on_hit_box_area_entered(area):
	if area.name == "hurtBox":
		print_debug("minggir")
		#velocity = -velocity * 50
		move_and_slide()
