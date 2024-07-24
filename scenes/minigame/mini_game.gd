extends Node2D

var stage: int = 1
var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	score_update()
	
	$MainUI/ColorRect.visible = false
	$MainUI/Dpads/Action.visible = false
	$MainUI/Dpads/Up.visible = false
	$MainUI/Dpads/Down.visible = false
	
	State.dungeonState = true

func _on_player_score_point(num, hp):
	if num == 1:
		score += 1
		SoundFx.getKain()
	elif num == 2:
		score -= 1
		SoundFx.hurtFx()
	
	if score < 0 or hp == 0 :
		score = 0
	score_update()
	upspeed()
	
func score_update(): #update text score
	$TileMap/Score/Label.text = "Score = " + str(score)

func upspeed(): #meningkatkan kesulitan monster
	if score > 2:
		$TileMap/batang.move_mult += randf_range(5, 10)
		$TileMap/batang.pup_time -= $TileMap/batang.pup_time + $TileMap/batang.pup_time * 0.2
	else:
		$TileMap/batang.move_mult = 50
