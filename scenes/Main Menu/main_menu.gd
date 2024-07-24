extends Control

@onready var anim = $Effect

		
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
#
	anim.play("transisiOut")
	await anim.animation_finished
	
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
#
#	match(playerMap):
#		"DesaBatik":
#			DoorHandle.changeStage(DoorHandle.DesaBatik)
#		"Museum":
#			DoorHandle.changeStage(DoorHandle.museum)
#		"Dungeon":
#			DoorHandle.changeStage(DoorHandle.Dungeon)	
#		_:
#			DoorHandle.changeStage(DoorHandle.museum)

func _on_btn_mini_game_pressed():
	pass # Replace with function body.
