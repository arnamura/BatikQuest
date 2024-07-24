extends Area2D

func _on_body_entered(body):
	if body.is_in_group("kain") or body.is_in_group("pedang") or body.is_in_group("shuriken"):
		body.queue_free()
