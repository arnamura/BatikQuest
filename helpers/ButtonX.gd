extends Button
@onready var ui : CanvasLayer = get_node("/root/World/DescriptionGUI")

func _physics_process(delta: float) -> void:
	if is_pressed():
		ui.hide()
