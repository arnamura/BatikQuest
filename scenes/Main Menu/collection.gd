extends Control

func _on_btn_ext_pressed():
	SoundFx.buttonClick()
	get_tree().change_scene_to_file("res://scenes/Main Menu/main_menu.tscn")
