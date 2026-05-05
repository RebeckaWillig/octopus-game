extends Area2D

func _ready() -> void:
	visible = true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.points += 1
		queue_free()
