extends CharacterBody2D

@export var speed: int = 35
@export var knockbackPower: int = 750

@onready var player = $"."
@onready var actionable_finder = $Direction/ActionableFinder
@onready var animations = $AnimationPlayer
@onready var effects = $Effect
@onready var hurtTimer = $Timer
@onready var animTimer = $Timer2
@onready var MapDetect = $MapDetection
@onready var playerSprite = $Sprite2D
@onready var weapon = $Weapon
@onready var dpad = load("res://helpers/joystick.gd")

@onready var statusBatik: Label = $statusBatik

@export var respawnMark : Marker2D
@export var hp = 3

var respawnPoint #tempat player respawn saat hp menyentuh 0
var isHurt: bool = false
var lastDirect: String = "Down"
var isAttack: bool = false
var isCinematic = false

var playerPos #mencatat kordinasi player
var playerMap #mencatat area/map dari player

signal score_point

func _ready():
	#agar diawal warna player default
	effects.play("reset")
	if respawnMark:
		respawnPoint = respawnMark.global_position
	else:
		respawnPoint = Vector2.ZERO

#untuk mengetahui posisi player (guna untuk spawn saat load game nanti)
func playerPosition():
	playerPos = global_position
	playerMap = get_tree().current_scene.name	
	
	State.playerPosLoad = playerPos
	State.playerMapLoad = playerMap

func _process(_delta):
	playerPosition()
	if State.getBatik == true:
		State.getBatik = false
		getBatikAnim()
	
#untuk handle input action
func _unhandled_input(_event: InputEvent) -> void:
	#untuk tombol interaksi
	if Input.is_action_just_pressed("ui_accept"):
		var actionable = actionable_finder.get_overlapping_areas()
		if actionable.size() > 0:
			State.notMove = true
			actionable[0].action() #aktivasi area pertama yang tumpang tindih
			return
	#untuk tombol berlari
	if Input.is_action_just_pressed("ui_shift"):
		speed = 100
	elif Input.is_action_just_released("ui_shift"):
		speed = 35

	
#untuk handle input gerakan 
func handleInput():
	if not State.notMove:
		#var moveDirection = State.posVector
		var moveDirectionKeyboard = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		#velocity = moveDirection*speed
		velocity = moveDirectionKeyboard*speed
#		if Input.is_action_just_pressed("ui_attack"):
#			getBatikAnim()
	else: 
		velocity = Vector2.ZERO

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
		if not isCinematic:
			if  animations.is_playing():
				animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y <0: direction = "Up"
		if speed == 100:
			animations.speed_scale = 2
		else:
			animations.speed_scale = 1
		animations.play("walk"+ direction)
		lastDirect = direction
	
func _physics_process(_delta): #ketika area dari player berupa "mapDetection" menyentuh area musuh "hitBox" akan memanggil fungsi Onhit()
	handleInput()
	move_and_slide()
	updateAnimation()
	if !isHurt:
		for area in MapDetect.get_overlapping_areas():
			if area.name == "hitBox":
				onHit(area)
				
func knockback2(enemyVelocity: Vector2): #mengambil vector arah musuh bergerak saat menyentuh player
	if hp != 0:
		var knockDir = (enemyVelocity - velocity).normalized() * knockbackPower
		velocity = knockDir
	move_and_slide()

func onHit(area): #fungsi akbiat dari saat player menyentuh musuh yang menyebabkan knockback dan hp berkurang
	hp = hp-1	
	isHurt = true
	
	knockback2(area.get_parent().velocity)
	SoundFx.hurtFx()
	effects.play("hurtAnim")
	hurtTimer.start()
	await hurtTimer.timeout
	#insert jika hp 0, layar menghitam dan player kembali kespawn
	effects.play("reset")
	if hp == 0:
		hp = 3
	isHurt = false	

func _stepSfx(): #trigger walk sfx
	SoundFx.walkFx()

func _on_map_detection_area_entered(area): #mendeteksi area player berada untuk play bgm song
	match area.name:
			"Village":
				SoundFx.playBgm(area.name)
			"Forrest":
				SoundFx.playBgm(area.name)
			"Dessert":
				SoundFx.playBgm(area.name)
			"Boss":
				SoundFx.playBgm(area.name)
			"Dungeon":
				SoundFx.playBgm(area.name)
			"Museum":
				SoundFx.playBgm(area.name)
			"TamanBunga":
				SoundFx.playBgm(area.name)
			"PortalArea":
				SoundFx.playBgm(area.name)

func _on_map_detection_area_exited(area): #mendeteksi area player berada untuk stop bgm song 
	match area.name:
		"Village":
			SoundFx.stopBgm(area.name)
		"Forrest":
			SoundFx.stopBgm(area.name)
		"Dessert":
			SoundFx.stopBgm(area.name)
		"Boss":
			SoundFx.stopBgm(area.name)
		"Dungeon":
			SoundFx.stopBgm(area.name)
		"Museum":
			SoundFx.stopBgm(area.name)
		"TamanBunga":
			SoundFx.stopBgm(area.name)
		"PortalArea":
			SoundFx.stopBgm(area.name)

func respawn(): #fungsi spawn ke lokasi awal dungeon ketika hp menyentuh 0
	position = respawnPoint
	#effects.play("transisiIn")
	
#---------------------------------Bagian Animasi Cutscene----------------------------------------#
func _play_anim(nameAnim) -> void:
	animations.play(nameAnim)

func _stop_anim() -> void:
	animations.stop()

func interactCutscene(): #Untuk triger cutscene awal permainan
	var actionable = actionable_finder.get_overlapping_areas()
	if actionable.size() > 0:
		actionable[0].action()
		return

#--------------------------------------------------------------------------------------------------#
func getBatikAnim(): #Animasi memunculkan teks mendapatkan batik
	statusBatik.visible = true
	var statusBatikPos = player.global_position.y
	var namaAfterTween: int = statusBatikPos - 35
	var tween = create_tween().tween_property(statusBatik, "global_position:y", namaAfterTween, 0.5).from(player.global_position.y).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	SoundFx.getItem()
	await tween.finished
	animTimer.start()
	await animTimer.timeout
	statusBatik.global_position.y = player.global_position.y
	
	statusBatik.visible = false
	pass

#tidak dipakai
#func timerknock():
#		effects.play("hurtAnim")
#		hurtTimer.start()
#		await hurtTimer.timeout
#		effects.play("reset")



func _on_map_detection_body_entered(body):
	if body.is_in_group("kain"):
		SoundFx.getKain()
		print("+1")
		emit_signal("score_point")
		body.queue_free()
