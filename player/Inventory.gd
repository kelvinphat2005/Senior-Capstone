extends Node

# Declare member variables here
var inventory = []
var equipped_item = null

@export var max_inv_slots = 10

@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("INVENTORY READY")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerVariables.inventory 
	PlayerVariables.equipped_item

func print_inventory():
	print("Inventory: ", inventory)

func add_item(item):
	PlayerVariables.inventory.append(item)
	PlayerVariables.equipped_item = item
	
func remove_item(item):
	PlayerVariables.inventory.pop(item)

func equip_item(item):
	PlayerVariables.equipped_item = item
	
func get_equipped():
	return PlayerVariables.equipped_item

func test():
	print("TEST")
