class_name Interact extends Area2D
#scene ini digunakan untuk menampilkan gambar batik beserta deskripsinya dengancara
#mengambil data dari file dataBatik.gd
#merupakan bluprint
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
	var batik = load(DataBatik[label_batik]["pathimg"])
	uiDesc.desk = DataBatik[label_batik]["deskripsi"]
	uiDesc.title = DataBatik[label_batik]["nama"]
	uiDesc.ciri = DataBatik[label_batik]["ciri"]
	uiDesc.texturerect.set_texture(batik)
	uiDesc.show()	
	
func updateText():
	#untuk update deksripsi ke ciri
	if uiDesc.currentPage == 0:
		uiDesc.desk = DataBatik[label_batik]["deskripsi"]
	elif uiDesc.currentPage == 1:
		uiDesc.desk =DataBatik[label_batik]["ciri"]

func _on_area_entered(area):
	if area.name == "MapDetection":
		player_in_range = true

func _unhandled_input(_event):
	if player_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			showUi()

func _on_area_exited(area):
	if area.name == "MapDetection":
		player_in_range = false
