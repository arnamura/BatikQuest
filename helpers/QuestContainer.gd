extends VBoxContainer

const MainQuest = preload("res://helpers/quest_panel.tscn")

func _ready():
	if get_child_count() ==0:
		var quest1 = MainQuest.instance()
		self.add_child(quest1)
