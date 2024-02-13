extends CanvasLayer

@onready var gambar: TextureRect = $PanelContainer/TextureRect

func _ready():
	visible = false
	
func gambarQuiz(gambarBatik):
	visible = true
	var batik = DataBatik[gambarBatik]["pathimg"]
	gambar.set_texture(load(batik))
	
func close():
	visible = false
