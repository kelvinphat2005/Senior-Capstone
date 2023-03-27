extends Control

@onready var item_name = $"Item Name"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_item_name("test")

func change_item_name(name):
	item_name.text = name
