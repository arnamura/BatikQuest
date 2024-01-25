extends Control

@onready var anim = $Effect

		
func _ready():
	State.load_game()
	SoundFx.mainmenuBgm()
	
func _on_btn_new_g_pressed():
	var playerMap = State.playerMapLoad

	SoundFx.buttonClick()
	SoundFx.mainmenuBgmStop()
	
	anim.play("transisiOut")
	await anim.animation_finished

	match(playerMap):
		"DesaBatik":
			DoorHandle.changeStage(DoorHandle.DesaBatik)
		"Museum":
			DoorHandle.changeStage(DoorHandle.museum)
		"Dungeon":
			DoorHandle.changeStage(DoorHandle.Dungeon)	


func _on_btn_load_g_pressed():
	pass # Replace with function body.


func _on_btn_sett_pressed():
	pass # Replace with function body.


func _on_btn_col_pressed():
	SoundFx.buttonClick()
	get_tree().change_scene_to_file("res://scenes/Main Menu/collection.tscn")


func _on_btn_ext_pressed():
	SoundFx.buttonClick()
	get_tree().quit()
