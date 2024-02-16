extends CharacterBody2D


@export var speed = 40
@export var limit = 0.5
@export var endPoint : Marker2D
@export var endPoint2 : Marker2D


@onready var animations = $Anim
@onready var noticeAnim = $Notice/AnimationPlayer
@onready var noticeImg = $Notice

@onready var namaBinatang = $".".name

var startPosition: Vector2
var endPosition: Vector2
var endPosition2: Vector2
var y = velocity
var pos: Vector2
var pos1cek: bool = false
var arrive = false

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	endPosition2 = endPoint2.global_position
	
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		endPosition = endPosition2
		pos1cek = true
	
	velocity = moveDirection.normalized()*speed
	
func arrived():
	
	velocity = Vector2.ZERO
	animations.stop()
	
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
	if State.takenQuest5 == true and not arrive:
		updateVelocity()
		move_and_slide()
		updateAnimation()
	if pos1cek and arrive:
		arrived()

	#if isStop == false:
	

func _on_stop_box_body_entered(body): #agar animals diam saat bertemu player
	if body.name == "Player": 
		SoundFx.meowFx()
		speed = 40
		
		noticeImg.visible = true
		noticeAnim.play("standby")
#	if State.takenQuest5 == false:
#		speed = 0
#	elif body.name == "Player": 
#		speed = 40
#		isStop = false


func _on_stop_box_body_exited(body): #agar animals kembali bergerak saat bertemu player
	if body.name == "Player":
#		isStop = true
		animations.stop()
		speed = 0
		noticeImg.visible = false
		noticeAnim.stop()

func _on_stop_box_area_entered(area):
	if area.name == "DesaLama":
		arrive = true
		State.reqItem5 = "1"

