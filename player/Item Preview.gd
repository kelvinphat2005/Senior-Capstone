extends Node3D

@onready var items = {
	1 : preload("res://assets/items/bandage/bandage.tscn"),
	2: preload("res://assets/items/medkit/medkit.tscn"),
	3: preload("res://assets/items/cup/cup.tscn")
}

var player
var preview_ready = false
var item_loaded = false
var previous_item = null

func _ready():
	if get_parent().get_parent().has_node("Player"):
		player = get_parent().get_parent().get_node("Player")
		preview_ready = true

func _process(delta):
	if preview_ready:
		rotate(Vector3(0, 1, 0), 0.005)
		var selected_item = player.get_node("Inventory HUD").vbox.selected_item
		if selected_item != null:
			if previous_item != selected_item:
				item_loaded = false
				for n in get_children():
					remove_child(n)
					n.queue_free()
			if item_loaded == false:
				print("gagagag")
				var it = items[selected_item.id]
				add_child(it.instantiate())
				previous_item = selected_item
				item_loaded = true
			else:
				pass
		else:
			pass
	
