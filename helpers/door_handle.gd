extends CanvasLayer

const MainWorld = ("res://scenes/world.tscn")
const Dungeon = ("res://scenes/dungeon.tscn")

func changeStage(stage_path):
	get_tree().change_scene_to_file(stage_path)
