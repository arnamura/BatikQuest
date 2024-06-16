extends CanvasLayer

@onready var hp: Panel = $HpPanel
@onready var poin: Label = $HpPanel/poin
@onready var player = $"../TileMap/Player"
@onready var hpPlayer = str(player.hp)
@onready var pause = $Pause
@onready var dpad = $Dpads
# Called when the node enters the scene tree for the first time.
func _ready():
	updateHp()
	dpad.visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if State.dungeonState:
		updateHp()
		hp.show()
	else:
		hp.hide()
	if State.notMove == true:
		dpad.visible = false
	else:
		dpad.visible = true

func updateHp():
	hpPlayer = str(player.hp)
	poin.text = hpPlayer
	
func _on_menu_pressed():
	SoundFx.buttonClick()
	pause.paused()
	pause.show()
