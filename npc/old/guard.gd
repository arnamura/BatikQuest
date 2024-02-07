extends CharacterBody2D

@export var speed = 5
@export var limit = 0.5
@export var endPoint : Marker2D

@onready var player = get_node("/root/World/TileMap/Player")
@onready var animations = $AnimationPlayer
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
	updateVelocity()
	move_and_slide()
	updateAnimation()


func _on_interact_area_entered(area):
	if area.name == "hurtBox":
		speed = 0
		
		#if player.position.y < position.y:
			#print_debug("dibawah")
		#elif player.position.y > position.y:
			#print_debug("diatas")
		#elif player.position.x < position.x:
			#print_debug("dikiri")
		#elif player.position.x > position.x:
			#print_debug("dikanan")
		
		


func _on_interact_area_exited(area):
	if area.name == "hurtBox":
		speed = 5
