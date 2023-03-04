extends Node

class_name Inventory

# Declare member variables here
var inventory = []
@export var max_inv_slots = 10

@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("INVENTORY READY")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
