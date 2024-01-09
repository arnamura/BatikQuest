extends CanvasLayer

@onready var collectiblePanel: ScrollContainer = $Panel/DisplayPanel/ScrollPanelBatikList

@onready var colPan = false :
	set(value):
		collectiblePanel.visible = value
		State.isPause = value

	
var is_paused = false : 
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused
	
func paused():
	self.is_paused = !is_paused

func _unhandled_input(event):
	if event.is_action_pressed("ui_pause"):
		SoundFx.buttonClick()
		paused()

func _on_resume_btn_pressed():
	SoundFx.buttonClick()
	self.is_paused = false
	get_parent().show()
	colPan = false
	
func _on_batik_btn_pressed():
	SoundFx.buttonClick()
	colPan =  true

func _on_quest_btn_pressed():
	SoundFx.buttonClick()
	colPan = false

func _on_quit_btn_pressed():
	SoundFx.buttonClick()
	colPan = false
	paused()
	DoorHandle.changeStage(DoorHandle.mainmenu)
