extends CharacterBody2D

@export var speed: int = 35
@onready var actionable_finder = $Direction/ActionableFinder
@onready var animations = $AnimationPlayer

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
	#var knockback_force = Vector2(0, 0)
	var i = velocity
	if area.name == "hitBox":
		velocity = -velocity * 50
		lerp(velocity, i, 0.2)
		move_and_slide()
		print_debug(area.get_parent().name)
	
