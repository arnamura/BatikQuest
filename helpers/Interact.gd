class_name Interact extends Area2D

@export var label_batik = "none"
@export_multiline var deskripsi_batik = "none"
@export var value = "none"
@export var path_gambar = "none"


@onready var uiDesc: CanvasLayer = $"../../../DescriptionGUI"

var player_in_range = false
#const Gui = preload("res://helpers/description_gui.tscn")
	
#func action() -> void:
	#var gui: Node = Gui.instantiate()
	#get_tree().current_scene.add_child(gui)
	#gui.start(interact_label)

func _ready():
	set_process(true)

func showUi():
	var batik = load(path_gambar)
	uiDesc.title = label_batik
	uiDesc.desk = deskripsi_batik
	uiDesc.texturerect.set_texture(batik)
	
	uiDesc.show()	

func _on_area_entered(area):
	if area.name == "hurtBox":
		player_in_range = true
		print_debug("halo")

func _unhandled_input(_event):
	if player_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			showUi()

func _on_area_exited(area):
	if area.name == "hurtBox":
		player_in_range = false
