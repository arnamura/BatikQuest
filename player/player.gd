extends CharacterBody2D

@export var speed: int = 35
@export var knockbackPower: int = 750

@onready var actionable_finder = $Direction/ActionableFinder
@onready var animations = $AnimationPlayer
@onready var effects = $Effect
@onready var hurtTimer = $Timer
@onready var slimePos= $"../slime" #import file slime
@onready var playerSprite = $Sprite2D

var isHurt: bool = false
var enemyInArea = []


func _ready():
	#agar diawal warna player default
	effects.play("reset")
	
#untuk handle input action
func _unhandled_input(_event: InputEvent) -> void:
	#untuk tombol berlari
	if Input.is_action_just_pressed("ui_shift"):
		speed = 150
	elif Input.is_action_just_released("ui_shift"):
		speed = 50
	#untuk tombol interaksi
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
	if !isHurt:
		for enemyArea in enemyInArea:
			onHit(enemyArea)
	
func _on_hurt_box_area_entered(area):
	# cek kondisi hurt bila hitbox musuh mengenai hurtbox player
	if area.name == "hitBox":
		enemyInArea.append(area)
		#knockback()
		print_debug(area.get_parent().name)
	# cek kondisi untuk fungsi interaksi
	if area.name == "Interact":
		print_debug(area.get_parent().name)
#	if area.has_method("collect"):
#		area.collect()

func knockback2(enemyVelocity: Vector2):
	var knockDir = (enemyVelocity - velocity).normalized() * knockbackPower
	velocity = knockDir
	move_and_slide()

func timerknock():
		effects.play("hurtAnim")
		hurtTimer.start()
		await hurtTimer.timeout
		effects.play("reset")

func onHit(area):
	isHurt = true
	knockback2(area.get_parent().velocity)
	effects.play("hurtAnim")
	hurtTimer.start()
	await hurtTimer.timeout
	effects.play("reset")
	isHurt = false	

func _on_hurt_box_area_exited(area):
	enemyInArea.erase(area)
