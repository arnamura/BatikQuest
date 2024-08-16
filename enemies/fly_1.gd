extends Area2D

@onready var anim = $AnimationPlayer
var speed: float = 0.5

func _ready():
	anim.play("walkLeft")
	stageDiff(State.stage)

func _process(delta):
	$".".position.x -= 1

func walk(i): #fungsi untuk bergerak kearah kiri suai dengan speed
	walk(speed)
	
func stageDiff(stage): #menentukan besar speed sesuai dengan stage
	match(stage):
		1:
			speed = 0.5
		2:
			speed = 0.8
		3:
			speed = 1

#func _on_area_entered(area):
#	if area.is_in_group("player_weap"):
##	if area.name == "PlayerKunai":
#		queue_free()
#	else: pass
