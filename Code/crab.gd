extends Area2D

const SPEED = 1
const LEFT_EDGE = 13
const RIGHT_EDGE = 256-LEFT_EDGE

var velocity

func _ready() -> void:
	velocity = SPEED
	global_position = Vector2(LEFT_EDGE,64)

func _physics_process(_delta: float) -> void:
	if global_position.x == RIGHT_EDGE:
		velocity = -SPEED
	elif global_position.x == LEFT_EDGE:
		velocity = SPEED
	global_position.x += velocity

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("You lose")
		get_tree().call_deferred("change_scene_to_file", "res://Code/end_lose.tscn")
