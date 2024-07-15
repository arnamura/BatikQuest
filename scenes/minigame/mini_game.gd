extends Node2D
var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	score_update()
	$MainUI/ColorRect.visible = false
	$MainUI/Dpads/Action.visible = false
	$MainUI/HpPanel.visible = true

func _on_player_score_point():
	score += 1
	score_update()
	
func score_update():
	$TileMap/Score/Label.text = "Score = " + str(score)
