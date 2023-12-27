extends Panel

@onready var icon: TextureRect =$HBoxContainer/Panel/TextureRect
@onready var namaBatik: Label = $HBoxContainer/namaBatik

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(batik):
	if !batik["isGet"]:
		namaBatik.text = "???"
	else:
		namaBatik.text = batik["nama"]
		icon.texture = load(batik["pathimg"])
