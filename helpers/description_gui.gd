extends CanvasLayer

@onready var texturerect : TextureRect = $Panel/TextureRect
@onready var label : Label = $Panel/label
@onready var deskripsi : RichTextLabel  = $Panel/DeskripsiGambar
@onready var buttonX : Button = $Panel/ButtonX
@onready var sub : Label = $Panel/subJudul
@onready var nextbtn : Button = $Panel/next

@export var title : String = ""
@export var desk : String = ""
@export var gambar : String
@export var ciri: String = ""
@onready var ui : CanvasLayer = $"."

var currentPage = 0
#var test = gambar
#var gambarfix = load(gambar)

func _process(_delta: float):
	update()
#	texturerect.set_texture(gambarfix)

func _on_button_x_pressed():
	SoundFx.buttonClick()
	ui.hide()
	

func _on_next_pressed():
	SoundFx.buttonClick()
	#button update deskripsi ke ciri
	if currentPage == 0:
		currentPage = +1
		update()
	elif currentPage == 1:
		currentPage = 0
		update()
	
func update():
	#untuk mengganti teks deskripsi dan teks button
	if currentPage == 0:
		deskripsi.text = desk
		sub.text = "Deskripsi:"
		nextbtn.text = "Ciri-ciri"
	elif currentPage == 1:
		deskripsi.text = ciri
		sub.text = "Ciri-ciri:"
		nextbtn.text = "Deskripsi"
	label.text = "Batik"+ " " + title
	
