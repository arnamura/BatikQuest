extends CanvasLayer

@onready var hp: Panel = $HpPanel
@onready var poin: Label = $HpPanel/poin
@onready var player = $"../TileMap/Player"
@onready var hpPlayer = str(player.hp)
@onready var pause = $Pause

# Called when the node enters the scene tree for the first time.
func _ready():
	updateHp()
	if State.dungeonState:
		hp.show()
	else:
		hp.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	updateHp()
	

func updateHp():
	hpPlayer = str(player.hp)
	poin.text = hpPlayer
	


func _on_menu_pressed():
	pause.paused()
	pause.show()
