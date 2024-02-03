extends CharacterBody2D


@export var speed = 20
@export var limit = 0.5
@export var endPoint : Marker2D


@onready var animations = $Anim
@onready var noticeAnim = $Notice/AnimationPlayer
@onready var noticeImg = $Notice

@onready var namaBinatang = $".".name

var startPosition: Vector2
var endPosition: Vector2
var y = velocity
var pos: Vector2
var isStop: bool = false

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



func _on_stop_box_body_entered(body): #agar animals diam saat bertemu player
	if body.name == "Player":
		print(namaBinatang)
		if namaBinatang == "Rakun":
			print("kena")
			isStop = true
			speed = 0
			animations.stop()
			
			noticeImg.visible = true
			noticeAnim.play("standby")

func _on_stop_box_body_exited(body): #agar animals kembali bergerak saat bertemu player
	if body.name == "Player":
		speed = 20
		isStop = false
		
		noticeImg.visible = false
		noticeAnim.stop()
