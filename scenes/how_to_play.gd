extends Control

@onready var panel = $ColorRect/Panel
@onready var panel2 = $ColorRect/Panel2
@onready var next = $ColorRect/next
@onready var prev = $ColorRect/prev
@onready var play = $ColorRect/play

var i = 0

func _ready():
	panel.visible = true
	panel2.visible = false
	play.visible = false

func _process(delta):
	if i == 0:
		prev.visible = false
		next.visible = true
		play.visible = false
	elif i == 1:
		next.visible = false
		prev.visible = true
		play.visible = true

func _on_prev_pressed():
	SoundFx.buttonClick()
	if i > 0:
		panel.visible = true
		panel2.visible = false
		i = i - 1

func _on_next_pressed():
	SoundFx.buttonClick()
	if i <= 0:
		panel.visible = false
		panel2.visible = true
		i = i + 1

func _on_play_pressed():
	var playerMap = State.playerMapLoad

	SoundFx.buttonClick()

	match(playerMap):
		"DesaBatik":
			DoorHandle.changeStage(DoorHandle.DesaBatik)
		"Museum":
			DoorHandle.changeStage(DoorHandle.museum)
		"Dungeon":
			DoorHandle.changeStage(DoorHandle.Dungeon)	
		_:
			DoorHandle.changeStage(DoorHandle.museum)
