extends Sprite2D

var player
var inventory 

var player_in_scene = false

@onready var test = preload("res://assets/items/Medkit/Medkit.png")

# Called when the node enters the scene tree for the first time.
# HUD is instantiated by the Player node
# so the parent of parent is player <-- wow
func _ready():
	player = get_parent().get_parent()
	inventory = player.get_node("Inventory")
	print("HUD.Holding READY")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump"):
		set_texture(test)
	
