extends Panel

#@onready var quest = "res://state.gd"
@onready var questLabel = get_node("Label")
@onready var questtext: String = ""

func _process(delta):
	cekQuest()

func cekQuest():
	var quest = State.questInfo
	var taken = false
	var takenMission = -1
	questLabel.text = "Cari Quest Dulu"
	for i in range(9):
		if quest[i]["taken"]:
			taken = true
			takenMission = i
			
	if taken:
		if quest[takenMission]["item"] == "1":
			questLabel.text = quest[takenMission]["text2"]
		else:
			questLabel.text = quest[takenMission]["text1"]



	#Daftar quest
#	var questNames = [1]
#	#Loop untuk memeriksa status quest

#	for questName in questNames:
#		var quest = State.questInfo[questName]
#		if not quest["status"]:
#			if not quest["taken"]:
#				questLabel.text = "Cari Quest Dulu"
#			else:
#				if quest["item"] == "1":
#					questLabel.text = quest["text2"]
#				else:
#					questLabel.text = quest["text1"]
#		else:
#			questLabel.text = "Cari Quest"

#	if State.quest1Status == false:
#		if State.get_quest1 == false:
#			questLabel.text = "cari Quest"
#		else:
#				if State.reqItem1 == "1":
#					questLabel.text = State.quest1text2
#				else:
#					questLabel.text = State.quest1text1
#	else:
#		questLabel.text = "cari Quest"	
