extends CharacterBody3D

@onready var anim_tree = $AnimationTree

# class_name Player
@onready var player = $"."

# Declare member variables here. Examples:
@export var speed = 4.0 # max speed
@export var jump_impuslse = 20.0
@export var gravity = 1.0
@export var accel = 0.8

var player_x = 0
var player_z = 0

# var velocity = Vector3.ZERO

@export var max_health = 100
var health = max_health

# player dependent instances
var camera
var cursor
var hud

@onready var inventory = $Inventory
@onready var inventory_hud = $"Inventory HUD"
@onready var quest_handler = $"Quest Handler"

var inventory_open = false

###
var game_stage = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree.active = true
	camera = get_parent().get_node("Player Camera3D")
	inventory_hud.visible = false
	print(inventory.inventory)
	
	if get_parent().has_node("Spawns"):
		var spawns = get_parent().get_node("Spawns")
		spawns.go_to_spawn()
	
func update_animation():
	#print("Update animation called")
	#print("Velocity:", velocity)
	#print("Speed:", speed)
	#print("Velocity:", velocity)
	#print("Velocity Length:", velocity.length())
	var blend_position = velocity.length() / speed
	#print("Blend position:", blend_position)
	#print("Velocity:", velocity)
	#print("Speed:", speed)
	anim_tree.set("parameters/BlendSpace1D/blend_position", blend_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# print(self.position)
	
	var direction = Vector3.ZERO
	
	if PlayerVariables.hud:
		hud = PlayerVariables.hud
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	# vf = vo + at
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	# print("VELOCITY X: {vel}".format({"vel":velocity.x}))
	velocity.z = move_toward(velocity.z, speed * direction.z, accel)
	velocity.y = gravity * -1
	
	set_velocity(velocity)
	set_up_direction(Vector3.UP)
	move_and_slide()
	
	look_towards_cursor()
	
	update_animation()
	
	if Input.is_action_pressed("inventory"):
		if inventory_open:
			inventory_hud.visible = false
			inventory_open = false
			show_hud()
		else:
			inventory_hud.visible = true
			inventory_open = true
			hide_hud()
			
		OS.delay_msec(200)
	
	

func look_towards_cursor():
	var ray_origin = Vector3.ZERO
	var ray_end = Vector3.ZERO
	
	var space_state = get_world_3d().get_direct_space_state()
	var params = PhysicsRayQueryParameters3D.new()
	
	# gets mouse position in viewport
	var mouse_position = get_viewport().get_mouse_position()
	
	params.from = camera.project_ray_origin(mouse_position)
	params.to = ray_origin + camera.project_ray_normal(mouse_position) * 2000
	params.exclude = [self]
	var result = space_state.intersect_ray(params)
	
	if not result.is_empty():
		var pos = result.position
		pos = Vector3(pos.x, self.position.y, pos.z)
		look_at(pos, Vector3.UP)
		
		var collider = result["collider"]
		
		if collider.get_class() == "Enemy":
			print("GAGAGAGAG")
	

func instance_hud():
	add_child(load("res://assets/hud/HUD.tscn").instantiate())
	var temp_hud = get_node("HUD")
	PlayerVariables.hud = temp_hud

func hide_hud():
	hud.visible = false
	for child in hud.get_node("Health").get_children():
		child.visible = false
	
func show_hud():
	hud.visible = true
	for child in hud.get_node("Health").get_children():
		child.visible = true

func get_quests():
	return quest_handler.all_quests
