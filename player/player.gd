extends CharacterBody2D

@export var speed: int = 35
@export var knockbackPower: int = 750

@onready var actionable_finder = $Direction/ActionableFinder
@onready var animations = $AnimationPlayer
@onready var effects = $Effect
@onready var hurtTimer = $Timer
@onready var hurtBox = $hurtBox
@onready var playerSprite = $Sprite2D
@onready var weapon = $Weapon

var isHurt: bool = false
var lastDirect: String = "Down"
var isAttack: bool = false

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
	
	if Input.is_action_just_pressed("ui_attack"):
		attack()

#Animasi Attack
func attack():
	animations.play("att" + lastDirect)
	isAttack = true
	weapon.visible = true
	await animations.animation_finished
	weapon.visible = false
	isAttack = false
	
#animasi berjalan
func updateAnimation():
	if isAttack: return
	if velocity.length() == 0:
		if  animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y <0: direction = "Up"
		animations.play("walk"+ direction)
		lastDirect = direction
	
func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	if !isHurt:
		for area in hurtBox.get_overlapping_areas():
			if area.name == "hitBox":
				onHit(area)
				
func knockback2(enemyVelocity: Vector2):
	var knockDir = (enemyVelocity - velocity).normalized() * knockbackPower
	velocity = knockDir
	move_and_slide()

func onHit(area):
	isHurt = true
	knockback2(area.get_parent().velocity)
	effects.play("hurtAnim")
	hurtTimer.start()
	await hurtTimer.timeout
	effects.play("reset")
	isHurt = false	

#tidak dipakai
func _on_hurt_box_area_exited(area): pass

func _on_hurt_box_area_entered(area): pass
	# cek kondisi untuk fungsi interaksi
	#if area.name == "Interact":
	#	print_debug(area.get_parent().name)

#func timerknock():
#		effects.play("hurtAnim")
#		hurtTimer.start()
#		await hurtTimer.timeout
#		effects.play("reset")
