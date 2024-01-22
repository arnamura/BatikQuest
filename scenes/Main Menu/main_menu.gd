extends Control

@onready var anim = $Effect

		
func _ready():
	if  SoundFx.bgmPlay == false:
		SoundFx.bgmPlay = true
		SoundFx.mainmenuBgm()
	
func _on_btn_new_g_pressed():
	SoundFx.buttonClick()
	SoundFx.bgmPlay = false
	anim.play("transisiOut")
	await anim.animation_finished
	DoorHandle.changeStage(DoorHandle.museum)


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
