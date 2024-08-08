extends Node2D

var stage: int = 1
var score: int = 0

var count: bool = false

@onready var gameOverUI = $GameOver
@onready var timer :Timer = $TimerStart/Timer
@onready var label :Label = $TimerStart/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	#timerStart()
	score = 0
	score_update()
	
	$TimerStart.visible = true
	
	$MainUI/ColorRect.visible = false
	$MainUI/Dpads/Action.visible = false
	$MainUI/Dpads/Up.visible = false
	$MainUI/Dpads/Down.visible = false
	gameOverUI.visible = false
	
	State.dungeonState = true
	
func _process(delta):
	if count == true:
		labelTimer()
	
func _on_player_score_point(num, hp):
	if num == 1:
		score += 1
		SoundFx.getKain()
	elif num == 2:
		score -= 1
		SoundFx.hurtFx()
	
	gameoverState(hp)
	score_update()
	upspeed()

func timerStart():
	count = true
	timer.start()
	
	await timer.timeout
	
	count = false
	$TimerStart.visible = false

func labelTimer():
	label.text = str(ceil(timer.time_left))

func score_update(): #update text score
	$TileMap/Score/Label.text = "Score = " + str(score)

func upspeed(): #meningkatkan kesulitan monster
	if score > 5:
		$TileMap/batang.move_mult += randf_range(5, 10)
		$TileMap/batang.pup_time -= $TileMap/batang.pup_time + $TileMap/batang.pup_time * 0.2
	else:
		$TileMap/batang.move_mult = 50

func gameoverState(n):
	match State.stage:
		1:
			if score == 5 and n > 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Berhasil"
				gameOverUI.visible = true
			if n == 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Gagal"
				gameOverUI.visible = true
			else:
				pass
		2:
			if score == 10 and n > 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Berhasil"
				gameOverUI.visible = true
			if n == 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Gagal"
				gameOverUI.visible = true
			else:
				pass
		3:
			if score == 12 and n > 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Berhasil"
				gameOverUI.visible = true
			if n == 0:
				paused()
				$GameOver/vbox/h1.text = "Kamu Gagal"
				gameOverUI.visible = true
			else:
				pass

var is_paused = false : 
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused

func paused():
	self.is_paused = !is_paused

func _on_tryagainbtn_pressed():
	SoundFx.buttonClick()
	paused()
	get_tree().reload_current_scene()
