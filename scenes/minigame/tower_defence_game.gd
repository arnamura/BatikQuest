extends Node2D

@onready var fly = preload("res://enemies/fly_1.tscn")
@onready var spawnArea = $TileMap/SpawnPoint/Spawn
@onready var timerSpawn = $TileMap/SpawnPoint/TimerSpawn
@onready var gameOverUI = $TileMap/GameOver
@onready var timerStart :Timer = $TileMap/TimerStart/Timer
@onready var label :Label = $TileMap/TimerStart/Label

var count: bool
var hp: int
var enemies_remain: int #batasan monster yang akan muncul pada tiap stage
var active_enemies: int #untuk menghitung monster yang ada pada map

func _ready():
	SoundFx.playBgm("MiniGame")
	timer()
	#spawnEnemies()
	enemies_remain = 3
	hp = 3

func _process(delta):
	print("enemies remainig = ", enemies_remain)
	print("act ene = ", active_enemies)
	print("hp = ", hp)
	if count == true:
		labelTimer()

func spawnEnemies(): #untuk memunculkan musuh pada area spawn
	var spawn = fly.instantiate()
	spawn.position = spawnArea.position
	get_parent().add_child.call_deferred(spawn)
	
	active_enemies += 1
	
	#agar spawn monster random
	var nodes = get_tree().get_nodes_in_group("spawnPoint")
	var node = nodes[randi() % nodes.size()]
	var pos = node.position
	spawnArea.position = pos

func _on_player_enemies_slayed():
	active_enemies -= 1
	gameOverState()

func timer():
	timerStart.start()
	count = true
	await timerStart.timeout
	count = false
	timerSpawn.start()
	$TileMap/TimerStart.visible = false
	
func labelTimer():
	label.text = str(ceil(timerStart.time_left))

func gameOverState():
	if hp > 0 :
		if active_enemies == 0 and enemies_remain == 0:
			paused()
			$TileMap/GameOver/vbox/h1.text = "Kamu  Berhasil"
			gameOverUI.visible = true
	elif hp == 0:
		if active_enemies == 0:
			paused()
			$TileMap/GameOver/vbox/h1.text = "Kamu  Gagal"
			gameOverUI.visible = true

func _on_timer_spawn_timeout():
	if enemies_remain >= 1:
		spawnEnemies()
		enemies_remain -= 1
	elif enemies_remain <= 0:
		pass

func _on_despawn_area_entered(area):
	if area.is_in_group("td_enemies"):
		hp -= 1
		active_enemies -= 1
		gameOverState()

var is_paused = false : 
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused

func paused():
	self.is_paused = !is_paused

func _on_backbtn_pressed():
	SoundFx.buttonClick()
	SoundFx.stopBgm("MiniGame")
	
	State.save_game()
	DoorHandle.changeStage(DoorHandle.mainmenu)

func _on_tryagainbtn_pressed():
	SoundFx.buttonClick()
	paused()
	get_tree().reload_current_scene()
