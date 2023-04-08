extends Node

# VERY IMPORTANT
# CHILDREN OF THIS NODE MUST HAVE THE PROPER COLLISION LAYER (3) AND MASK (2)
# WILL NOT WORK PROPERLY IF NOT DONE!!!!!

var items = []

@onready var player = $"../Player"

var inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = player.get_node("Inventory")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var children = get_children()
	for item in children:
		# item must have its collision_mask at 2 (player) for this to work
		if item.visible:
			if item.has_overlapping_bodies(): # if player enters the collision shape of item
				if Input.is_action_pressed("interact"):
					print("Item interacted with")
					item.visible = false
					inventory.add_item(item)
				
	
	
