extends Control

@onready var anim = $Effect
@onready var miniGame = $minigame
@onready var selectStage = $selectStage
@onready var ctm = $minigame/VBoxContainer/mini_game

@onready var stage: String
@onready var dif: int
		
func _ready():
	State.load_game()
	SoundFx.mainmenuBgm()

func _on_btn_col_pressed():
	SoundFx.buttonClick()
	get_tree().change_scene_to_file("res://scenes/Main Menu/collection.tscn")

func _on_btn_ext_pressed():
	SoundFx.buttonClick()
	get_tree().quit()

func _on_btn_continue_pressed():
#	var playerMap = State.playerMapLoad
#
	SoundFx.buttonClick()
	SoundFx.mainmenuBgmStop()

	anim.play("transisiOut")
	await anim.animation_finished
	
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
	
func _on_btn_mini_game_pressed():
	SoundFx.buttonClick()
	miniGame.visible = true

# ------------------------------minigame container--------------------------------------------------
func _on_mini_game_pressed():
	SoundFx.buttonClick()
	selectStage.visible = true
	stage = $minigame/VBoxContainer/mini_game.get_name()
	
	$selectStage/VBoxContainer/LabelDeskripsi/Label.text = "Dapatkan kain mori yang dijatuhkan oleh monster batang. jangan sampai mengambil senjata tajam"
	$selectStage/VBoxContainer/LabelDeskripsi/StageReq/req1.text = "Stage 1: 5 Kain"
	$selectStage/VBoxContainer/LabelDeskripsi/StageReq/req2.text = "Stage 2: 10 Kain"
	$selectStage/VBoxContainer/LabelDeskripsi/StageReq/req3.text = "Stage 3: 12 Kain"
	
func _on_btn_close_pressed():
	SoundFx.buttonClick()
	miniGame.visible = false

#-------------------------------selectStage container-----------------------------------------------
func _on_btn_close_2_pressed():
	SoundFx.buttonClick()
	selectStage.visible = false

func _on_btn_1_pressed():
	SoundFx.buttonClick()
	SoundFx.mainmenuBgmStop()
	
	var linkTemp = "res://scenes/minigame/"+str(stage)+".tscn"
	State.stage = 1
	get_tree().change_scene_to_file(linkTemp)

func _on_btn_2_pressed():
	SoundFx.buttonClick()
	SoundFx.mainmenuBgmStop()
	
	var linkTemp = "res://scenes/minigame/"+str(stage)+".tscn"
	State.stage = 2
	get_tree().change_scene_to_file(linkTemp)

func _on_btn_3_pressed():
	SoundFx.buttonClick()
	SoundFx.mainmenuBgmStop()
	
	var linkTemp = "res://scenes/minigame/"+str(stage)+".tscn"
	State.stage = 3
	get_tree().change_scene_to_file(linkTemp)


#----------------------------------unused------------------------------------------
#	match(playerMap):
#		"DesaBatik":
#			DoorHandle.changeStage(DoorHandle.DesaBatik)
#		"Museum":
#			DoorHandle.changeStage(DoorHandle.museum)
#		"Dungeon":
#			DoorHandle.changeStage(DoorHandle.Dungeon)	
#		_:
#			DoorHandle.changeStage(DoorHandle.museum)
