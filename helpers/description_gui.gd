extends CanvasLayer

@onready var texturerect : TextureRect = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var label : RichTextLabel = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer3/label
@onready var deskripsi : RichTextLabel  = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/DeskripsiGambar
@onready var buttonX : Button = $MarginContainer/PanelContainer/VBoxContainer/ButtonX

@export var title : String = ""
@export var desk : String = ""
@export var gambar : String
#var test = gambar
#var gambarfix = load(gambar)

func _process(_delta: float):
	label.text = title
	deskripsi.text = desk
#	texturerect.set_texture(gambarfix)
