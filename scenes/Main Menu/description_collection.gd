extends Control

@onready var pict : TextureRect = $Panel/TextureRect
@onready var nama : Label = $Panel/nama
@onready var desc : Label = $Panel/deskripsi
@onready var next : Button = $Panel/BtnNext
@onready var sub : Label = $Panel/sub

# Called when the node enters the scene tree for the first time.
@onready var page = 0



func _process(delta):
	if !DataBatik.visibleDesc:
		get_parent().visible = false
	else:
		get_parent().visible = true
		showDesc(DataBatik.pressedBatik)

func showDesc(batik):
	if !batik["isGet"]:
		pass
	else:
		var gambar = load(batik["pathimg"])
		pict.set_texture(gambar)
		nama.text = batik["nama"]
		desc.text = batik["deskripsi"]

func updateText():
	if page == 0:
		next.text = "Ciri-ciri"
		sub.text = "Deskripsi" 
		desc.text = DataBatik.pressedBatik["deskripsi"]
	elif page == 1:
		next.text = "Deskripsi"
		sub.text = "Ciri-ciri" 
		desc.text = DataBatik.pressedBatik["ciri"]

func _on_btn_next_pressed():
	if page == 0:
		updateText()
		page = 1
	elif page == 1:
		updateText()
		page = 0
