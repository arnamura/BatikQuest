extends GridContainer


@onready var slots: Array = $".".get_children()


func _ready():
	updateCol()

func _process(delta):
	updateCol()

func updateCol():
	for i in range(min(9, slots.size())):
		var data_name = "batik" + str(i+1)
		slots[i].update(DataBatik[data_name])
