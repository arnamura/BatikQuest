extends Control

@onready var slots: Array = $Panel/GridContainer.get_children()

func _ready():
	updateCol()
	
func updateCol():
	for i in range(min(9, slots.size())):
		var data_name = "batik" + str(i+1)
		print_debug(DataBatik[data_name]["nama"])
		slots[i].update(DataBatik[data_name])
