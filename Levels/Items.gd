extends Node

var items = []

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_items()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for item in items:
		# item must have its collision_mask at 2 (player) for this to work
		if item.visible:
			if item.has_overlapping_bodies(): # if player enters the collision shape of item
				if Input.is_action_pressed("interact"):
					print("Item interacted with")
					item.visible = false
					player.get_node("Inventory").add_item(item)
					

func get_items():
	var children = get_children()
	for child in children:
		items.append(child)
	
	
