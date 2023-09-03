extends VBoxContainer

const QuestList = preload("res://helpers/quest_panel.tscn")

func _ready():
	if get_child_count()==0:
		addQuest()
	
func addQuest():
		var quest1_instance = QuestList.instantiate()
		self.add_child(quest1_instance)

