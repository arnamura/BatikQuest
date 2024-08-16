extends Control

@onready var slots: Array = $Panel/GridContainer.get_children()


func _ready():
	updateCol()

func _process(delta):
	updateCol()

func updateCol():
	for i in range(min(18, slots.size())):
		var nomorBatik = "batik" + str(i+1)
		slots[i].update(DataBatik[nomorBatik])

