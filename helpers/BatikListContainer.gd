extends GridContainer


@onready var slots: Array = $".".get_children()
@onready var panel1: Panel = $"1"
@onready var detailBatik: NinePatchRect = $"../../../../DetailBatikPausePanel"

func _ready():
	updateCol()

func _process(_delta):
	updateCol()
		
func updateCol():
	for i in range(min(9, slots.size())):
		var data_name = "batik" + str(i+1)
		slots[i].update(DataBatik[data_name])

func _on__pressed_sign(is_pressed):
	detailBatik.visible = is_pressed
