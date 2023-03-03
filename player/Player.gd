extends KinematicBody

class_name Player

# Declare member variables here. Examples:
export var speed = 14.0 # max speed
export var jump_impuslse = 20.0
export var gravity = 75.0
export var accel = 1.5

export var cam_pos = 0

var player_x = 0
var player_z = 0

var velocity = Vector3.ZERO

export var max_health = 100
var health = max_health

# player dependent instances
var camera
var cursor

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_parent().get_node("Player Camera")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# print(self.translation)
	
	var direction = Vector3.ZERO
	
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
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	look_towards_cursor()

func look_towards_cursor():
	var ray_origin = Vector3.ZERO
	var ray_end = Vector3.ZERO
	
	var space_state = get_world().direct_space_state
	
	# gets mouse position in viewport
	var mouse_position = get_viewport().get_mouse_position()
	
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 2000
	
	var result = space_state.intersect_ray(ray_origin, ray_end, [self])
	
	if not result.empty():
		var pos = result.position
		pos = Vector3(pos.x, self.translation.y, pos.z)
		look_at(pos, Vector3.UP)
		
		var collider = result["collider"]
		
		if collider.get_class() == "Enemy":
			print("GAGAGAGAG")
