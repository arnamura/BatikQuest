extends Panel

@onready var background: Sprite2D = $Button/Background
@onready var icon: Sprite2D = $Button/CenteredContainer/Panel/Icon
@onready var btn: Button = $Button
@onready var desc = preload("res://scenes/Main Menu/description_collection.tscn")

var setDescBatik 
var empty = true
#bakal diedit variable temp nyaa 

func update(batik):
	if !batik["isGet"]:
		background.frame = 0
		icon.visible = false	
		btn.disabled = true	
	else:
		empty = false
		background.frame = 1
		icon.visible = true 
		icon.texture = load(batik["pathimg"]) 
		setDescBatik = batik

func _on_button_pressed():
	if setDescBatik["isGet"] :
		DataBatik.pressedBatik = setDescBatik
		DataBatik.visibleDesc = true
	else:
		pass
