extends Control

@onready var item_name = $"Item Name"
@onready var vbox = $CanvasLayer/ScrollContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerVariables.inventory_hud = self
	
	var selected_item = vbox.selected_item
	if selected_item != null:
		change_item_name(selected_item.item_name)
	else:
		change_item_name("No Item")

func change_item_name(name):
	item_name.text = name
