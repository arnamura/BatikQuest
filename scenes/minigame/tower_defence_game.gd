extends Node2D

#@onready var fly = preload("res://enemies/fly_1.tscn")
@onready var spawnArea = $TileMap/SpawnPoint/Spawn
@onready var timerSpawn = $TileMap/SpawnPoint/TimerSpawn
@onready var gameOverUI = $TileMap/GameOver
@onready var timerStart :Timer = $TileMap/TimerStart/Timer
@onready var label :Label = $TileMap/TimerStart/Label

@onready var enemy_list = [
	preload("res://enemies/fly_1.tscn"),
	preload("res://enemies/fly_2.tscn"),
	preload("res://enemies/fly_3.tscn")
]
@onready var stage: int = State.stage

var count: bool
var hp: int
var enemies_remain: int #batasan monster yang akan muncul pada tiap stage
var active_enemies: int #untuk menghitung monster yang ada pada map
var enemiesVariation: int #untuk menyesuaikan variasi musuh dengan modulo

func _ready():
	State.dungeonState == false
	$MainUI/Dpads/Att.visible = true
	$MainUI/Dpads/Action.visible = false
	$MainUI/ColorRect.visible = false
	
	diffStage()
	SoundFx.playBgm("MiniGame")
	timer()
	
func _process(delta):
	State.dungeonState == false
	updateLabel()
	gameOverState()

func spawnEnemies(): #untuk memunculkan musuh pada area spawn
	var enemy_spawn = randi_range(0, enemy_list.size()-enemiesVariation) #random kemunculan musuh menyesuaikan list musuh modulo enemies variation
	var spawn = enemy_list[enemy_spawn].instantiate()
	spawn.connect("enemy_dead", _on_enemy_dead)
	spawn.position = spawnArea.position
	get_parent().add_child.call_deferred(spawn)
	
	active_enemies += 1
	
	#agar spawn monster random
	var nodes = get_tree().get_nodes_in_group("spawnPoint")
	var node = nodes[randi() % nodes.size()]
	var pos = node.position
	spawnArea.position = pos

func _on_player_enemies_slayed():
	gameOverState()

func _on_enemy_dead(): #signal ketika musuh mati
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

func diffStage():
	hp = 3
	match(stage):
		1:
			enemiesVariation = 2
			enemies_remain = 8
		2:
			enemiesVariation = 1
			enemies_remain = 10
		3:
			enemiesVariation = 1
			enemies_remain = 12	

func gameOverState():
	if hp > 0 :
		if active_enemies == 0 and enemies_remain == 0:
			State.cekMinigame2Status(stage)
			paused()
			$TileMap/GameOver/vbox/h1.text = "Kamu  Berhasil"
			$TileMap/GameOver/vbox/h2.text = "Kamu berhasil mengusir monster dan menlindungi Desa!"
			gameOverUI.visible = true
	elif hp == 0:
			paused()
			$TileMap/GameOver/vbox/h1.text = "Kamu  Gagal"
			$TileMap/GameOver/vbox/h2.text = "Monster berhasil mengganggu kedamaian Desa. Beruntung penjaga di sana hebat"
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
	deleteEnemy()
	State.save_game()
	DoorHandle.changeStage(DoorHandle.mainmenu)
	paused()

func _on_tryagainbtn_pressed():
	SoundFx.buttonClick()
	deleteEnemy()
	paused()
	get_tree().reload_current_scene()

func updateLabel(): #untuk update label UI
	$hp.text = "HP :  "+ str(hp)
	$remain.text = "Sisa  Monster:  "+ str(enemies_remain)
	if count == true:
		labelTimer()

func deleteEnemy():
	var enemy_list = get_tree().get_nodes_in_group("td_enemies")
	for enemy in enemy_list:
		enemy.queue_free()
