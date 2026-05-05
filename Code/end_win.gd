extends Node2D

@onready var label = $Control/Label

func _ready() -> void:
	label.text = "\nYOU WIN!!!\nYOUR TIME WAS %.2f S\n\nPRESS SPACE TO\nRETURN TO MENU" % Data.time

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://Code/menu.tscn")
