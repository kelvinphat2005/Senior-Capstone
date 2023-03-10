extends VBoxContainer

@onready var player = get_parent().get_parent().get_parent()

var finished_loading_slots = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.inventory_open:
		if finished_loading_slots == false:
			load_slots()
			finished_loading_slots = true
	else:
		for i in get_children():
			i.queue_free()
		finished_loading_slots = false
	
func load_slots():
	if finished_loading_slots == false:
		var inventory = player.inventory.inventory
		for i in inventory:
			var item_slot = load("res://assets/hud/inventory_slot.tscn")
			add_child(item_slot.instantiate())
		var current_slot = 0
		for child in get_children():
			child.item = inventory[current_slot]
			child.text = child.item.item_name
			current_slot += 1
