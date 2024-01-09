extends Panel

@onready var background: Sprite2D = $Button/Background
@onready var icon: Sprite2D = $Button/CenteredContainer/Panel/Icon
@onready var btn: Button = $Button

var setDescBatik #menyimpan data batik yang dipilih sementara untuk dioper lagi
var empty = true
#bakal diedit variable temp nyaa 

func update(batik):
	if !batik["isGet"]:
		background.frame = 0 #gambar container batik
		icon.visible = false	
		btn.disabled = true	
	else:
		empty = false
		background.frame = 1
		icon.visible = true 
		icon.texture = load(batik["pathimg"]) 
		setDescBatik = batik

func _on_button_pressed():
	SoundFx.buttonClick()
	if setDescBatik["isGet"]:
		DataBatik.pressedBatik = setDescBatik
		DataBatik.visibleDesc = true
	else:
		pass
