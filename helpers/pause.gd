extends CanvasLayer


var is_paused = false : 
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_pause"):
		self.is_paused = !is_paused
		

func _on_button_pressed():
	self.is_paused = false
