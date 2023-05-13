extends Node

var inventory = []
var inventory_hud
var equipped_item = null

var quest_handler
var all_quests
var current_quests

var level_spawn

var hud

var collected_items = []

var player_ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player_ready = true

func _process(delta):
	pass
