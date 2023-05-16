extends CharacterBody2D

@export var speed: int = 35
@onready var actionable_finder = $Direction/ActionableFinder
@onready var animations = $AnimationPlayer
@onready var slimePos= get_node("/root/World/TileMap/slime") #import file slime
@onready var playerSprite = $Sprite2D

#untuk handle input action
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionable = actionable_finder.get_overlapping_areas()
		if actionable.size() > 0:
			actionable[0].action()
			return
 
#untuk handle input gerakan 
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

#untuk animasi berjalan
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
	handleInput()
	move_and_slide()
	updateAnimation()
	
func _on_hurt_box_area_entered(area):
	if area.name == "hitBox":
		set_modulate(Color("d95351"))
		if velocity == Vector2(0,0):
			velocity = slimePos.velocity * 25
		else:
			velocity = -velocity * 25
		playerSprite.modulate = Color('red')
		$Timer.start()
		move_and_slide()
		print_debug(velocity)
		print_debug(area.get_parent().name)

func _on_timer_timeout():
	playerSprite.modulate = Color(1,1,1,1)
