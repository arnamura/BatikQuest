extends Panel

@onready var icon: TextureRect =$HBoxContainer/Panel/TextureRect
@onready var namaBatik: Label = $HBoxContainer/namaBatik
@onready var panel: Panel = $"."
@onready var btn: Button = $HBoxContainer/Button

var pressed = false
var batikTemp
var i
signal pressedSign(is_pressed: bool)

func update(batik):
	if !batik["isGet"]:
		namaBatik.text = "???"
		batikTemp = batik
		#btn.disabled = true
	else:
		namaBatik.text = batik["nama"]
		icon.texture = load(batik["pathimg"])
		batikTemp = batik
		btn.disabled = false
		
func _on_button_pressed():
	SoundFx.buttonClick()
	if batikTemp["isGet"] == true :
		DataBatik.pressedBatik = batikTemp
		DataBatik.getBat = true
	else:
		DataBatik.pressedBatik = batikTemp
		
	pressed = !pressed
	pressedSign.emit(pressed)
	pressed = !pressed
