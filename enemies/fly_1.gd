extends Area2D

@onready var anim = $AnimationPlayer
var speed: float = 0.5
var hpFly: int

signal enemy_dead

func _ready():
	anim.play("walkLeft")
	#stageDiff(State.stage)
	hpAdjust()

func _process(delta):
	$".".position.x -= speed

func walk(i): #fungsi untuk bergerak kearah kiri suai dengan speed
	walk(speed)

func hpAdjust():
	match($".".name):
		"fly1":
			hpFly = 1
			speed = 0.8
		"fly2":
			hpFly = 1
			speed = 1.2
		"fly3":
			hpFly = 2
			speed = 0.5

func _on_area_entered(area):
	if area.is_in_group("player_weap"):
		hpFly -= 1
		if hpFly <= 0:
			emit_signal("enemy_dead")
			queue_free()
		else: pass
	elif area.name == "Despawn":
		queue_free()
