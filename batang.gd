extends Node2D

@export var kain_mori : PackedScene
@export var pedang : PackedScene
@export var shuriken : PackedScene

var left_end: float = 30
var right_end: float = 200
var dir: float = 1.0
var move_mult: float = 50

var pup: bool = false
var pup_time: float = 1
var change_dir_time: float = 3 #waktu untuk mengganti arah

func _ready():
	pup = false
	if dir > 0:
		$AnimatedSprite2D.play("walkRight")
	elif dir < 0:
		$AnimatedSprite2D.play("walkLeft")

func _physics_process(delta): 
	#pergerakan monster
	position.x += dir * move_mult * delta
	
	#cek batas kiri dan kanan
	if position.x > right_end or position.x < left_end:
		change_dir()
	
	# countdown ganti arah pergerakan
	change_dir_time -= delta
	if change_dir_time <= 0:
		change_dir()
		change_dir_time = randi_range(1, 10) # Mengatur ulang waktu perubahan arah secara acak
	
	# countdown waktu pup
	pup_time -= delta
	if pup_time <= 0:
		pup_kain()

func change_dir():
	dir = -dir
	if position.x > right_end:
		$AnimatedSprite2D.play("walkLeft")
	elif position.x < left_end:
		$AnimatedSprite2D.play("walkRight")
		
func pup_kain():
	pup = true
	$AnimatedSprite2D.play("pup")
	
func spawn_pup():
	var random_choice = randi() % 3
	var item_spawn : PackedScene
	
	if random_choice == 0:
		item_spawn = kain_mori
	elif random_choice == 1:
		item_spawn = pedang
	elif random_choice == 2:
		item_spawn = shuriken
		
	var spawn = item_spawn.instantiate()
	spawn.position = self.position

	get_parent().add_child(spawn)

func _on_animated_sprite_2d_frame_changed():
	if pup and $AnimatedSprite2D.frame == 3:
		spawn_pup()

func _on_animated_sprite_2d_animation_finished():
	if pup and $AnimatedSprite2D.animation == "pup":
		pup = false
		if dir > 0:
			$AnimatedSprite2D.play("walkRight")
		elif dir < 0:
			$AnimatedSprite2D.play("walkLeft")
		pup_time = randi_range(0.5,3)
		
