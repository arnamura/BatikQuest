extends Node2D

@export var kain_mori : PackedScene
@export var pedang : PackedScene

var left_end: float = 7
var right_end: float = 200
var dir: float = 1.0
var move_mult: float = 50

var pup: bool = false
var pup_time: int = 128

func _ready():
	pup = false
	$AnimatedSprite2D.play("walk")

func _physics_process(delta): 
	position.x += dir * move_mult * delta
	if position.x > right_end:
		dir = -1.0
	elif position.x < left_end:
		dir = 1.0
	pup_time -= 1
	if pup_time <=0:
		pup_kain()
	
func pup_kain():
	pup = true
	$AnimatedSprite2D.play("pup")
	
func spawn_pup():
	var random_choice = randi() % 2
	var item_spawn : PackedScene
	
	if random_choice == 0:
		item_spawn = kain_mori
	elif random_choice == 1:
		item_spawn = pedang
		
	var spawn = item_spawn.instantiate()
	spawn.position = self.position
	get_parent().add_child(spawn)

func _on_animated_sprite_2d_frame_changed():
	if pup and $AnimatedSprite2D.frame == 3:
		spawn_pup()

func _on_animated_sprite_2d_animation_finished():
	if pup and $AnimatedSprite2D.animation == "pup":
		pup = false
		$AnimatedSprite2D.play("walk")
		pup_time = randi_range(128,1024)
