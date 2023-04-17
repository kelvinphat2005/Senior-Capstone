extends Node

@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	var quest_handler = player.get_node("Quest Handler")
	quest_handler.add_quest(1)
	
'''
func _process(delta):
	if Input.is_action_just_pressed("debug_1"):
		print("adsasdads")
		get_tree().change_scene_to_file("res://levels/test level/Test Level.tscn")
'''
