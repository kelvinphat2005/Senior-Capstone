extends Label


# Declare member variables here. Examples:
var scene

var player_in_scene = false
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	scene = get_tree().get_root()
	for i in scene.get_children():
		scene = i
	
	if scene.has_node("Player"):
		player_in_scene = true
		player = scene.get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_scene:
		text = str(player.health)
