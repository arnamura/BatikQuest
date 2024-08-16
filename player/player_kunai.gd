extends Area2D

@onready var kunai = $"."
@onready var i = 0

signal eliminated

func _process(delta):
	if i <= 156:
		i += 1
		kunai.position.x += 1
	elif i > 156:
		kunai.queue_free()
		
func _on_area_entered(area):
	if area.is_in_group("td_enemies"):
		SoundFx.hurtFx()
		area.queue_free()
		emit_signal("eliminated")
		kunai.queue_free()
