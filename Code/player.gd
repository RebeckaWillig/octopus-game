extends CharacterBody2D

const SPEED = 5.0
const MAX_SPEED = 200.0
var SPEED_X = 0
var SPEED_Y = 0

const LEFT_EDGE = 7
const RIGHT_EDGE = 256-7
const UPPER_EDGE = 8
const LOWER_EDGE = 128-10

var points

func _ready():
	global_position = Vector2(128,64)
	points = 0
	Data.time = 0.0

func _physics_process(delta: float) -> void:
	# Update timer
	Data.time += delta
	# Handle movement
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x += direction * SPEED
		if velocity.x > MAX_SPEED:
			velocity.x = MAX_SPEED
		elif velocity.x < (-MAX_SPEED):
			velocity.x = (-MAX_SPEED)
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
	direction = Input.get_axis("move_up","move_down")
	if direction:
		velocity.y += direction * SPEED
		if velocity.y > MAX_SPEED:
			velocity.y = MAX_SPEED
		elif velocity.y < (-MAX_SPEED):
			velocity.y = (-MAX_SPEED)
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)
	velocity.normalized()
	move_and_slide()
	# Handle manuel restart
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://Code/game.tscn")
	# Handle lose
	var posx = global_position.x
	var posy = global_position.y
	if posx < LEFT_EDGE or posx > RIGHT_EDGE or posy < UPPER_EDGE or posy > LOWER_EDGE:
		get_tree().change_scene_to_file("res://Code/end_lose.tscn")
	# Handle win
	if points >= 4:
		get_tree().change_scene_to_file("res://Code/end_win.tscn")
