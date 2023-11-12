extends Panel

@onready var background: Sprite2D = $Background
@onready var icon: Sprite2D = $CenteredContainer/Panel/Icon

#bakal diedit variable temp nyaa 

func update(batik):
	if !batik["isGet"]:
		background.frame = 0
		icon.visible = false
	else:
		background.frame = 1
		icon.visible = true 
		icon.texture = load(batik["pathimg"]) 
