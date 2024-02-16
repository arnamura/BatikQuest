extends Area2D

#@onready var uiDesc: CanvasLayer = get_node("/root/World/DescriptionGUI")

@export var ui_in_range = false

func _on_interact_area_entered(area):
	if area.name == "hurtBox":
		ui_in_range = true
	else:
		ui_in_range = false

##func _unhandled_input(event):
#	#if ui_in_range == true:
#		#if Input.is_action_just_pressed("ui_accept"):
#				#get_node("../../DescriptionGUI").visible = true
