extends CanvasLayer

@onready var texturerect : TextureRect = $MarginContainer/NinePatchRect/VBoxContainer/HBoxContainer/TextureRect
@onready var label : RichTextLabel = $MarginContainer/NinePatchRect/VBoxContainer/HBoxContainer3/label
@onready var deskripsi : RichTextLabel  = $MarginContainer/NinePatchRect/VBoxContainer/HBoxContainer2/DeskripsiGambar
@onready var buttonX : Button = $MarginContainer/NinePatchRect/ButtonX

@export var title : String = ""
@export var desk : String = ""
@export var gambar : String
@onready var ui : CanvasLayer = $"."
#var test = gambar
#var gambarfix = load(gambar)

func _process(_delta: float):
	label.text = title
	deskripsi.text = desk
#	texturerect.set_texture(gambarfix)


func _on_button_x_pressed():
	ui.hide()
