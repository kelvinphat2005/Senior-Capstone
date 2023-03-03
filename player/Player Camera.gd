extends Spatial

var READY = false

# the radius area that the player can be before the camera starts to follow
export var inner_cam_thresh = 8
# the radius the player can be before the camera completely stops
export var outer_cam_thresh = 24

# cam offsets
export var z_offset = 0
export var y_offset = 0

# other variables
var player
var origin = Vector3.ZERO
var in_radius_x = true
var in_radius_z = true
var player_pos
var player_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	# checks if there is a "Player" node in scene
	# cam will not appear/work if there is no "Player"
	if get_parent().has_node("Player"):
		player = get_parent().get_node("Player")
		player_pos = player.translation
		player_speed = player.speed
		
		READY = true

		# sets camera position
		transform.origin = Vector3(player_pos.x,20+y_offset,player_pos.z+12+z_offset)
		rotation_degrees = Vector3(-45, 0, 0) 
		
		# creates origin point
		# inner and outer cam thresholds are based on this
		var origin = Vector3(translation.x,0,translation.z)
		

func _process(delta):
	if READY:
		# camera movemeent
		# print(player.translation.z - origin.z)
		if in_radius_x:
			if player.translation.x - origin.x > inner_cam_thresh:
				translate(Vector3(player.velocity.x * delta,0,0))
			elif player.translation.x - origin.x < inner_cam_thresh * -1:
				translate(Vector3(player.velocity.x * delta,0,0))
				
			if player.translation.x - origin.x > outer_cam_thresh:
				in_radius_x = false
			elif player.translation.x - origin.x < outer_cam_thresh * -1:
				in_radius_x = false
		else:
			if player.translation.x - origin.x < outer_cam_thresh and player.translation.x > inner_cam_thresh:
				in_radius_x = true
			elif player.translation.x - origin.x > outer_cam_thresh * -1 and player.translation.x < inner_cam_thresh * -1:
				in_radius_x = true
				
		if in_radius_z:
			if player.translation.z - origin.z > inner_cam_thresh:
				translate(Vector3(0,0,0))
				in_radius_z = false
			elif player.translation.z - origin.z < inner_cam_thresh * -1:
				translate(Vector3(0,player.velocity.z * delta * -1,player.velocity.z * delta))
				in_radius_z = false
		else:
			if player.translation.z - origin.z < outer_cam_thresh and player.translation.z > inner_cam_thresh:
				in_radius_z = true
			elif player.translation.z - origin.x > outer_cam_thresh * -1 and player.translation.z < inner_cam_thresh * -1:
				in_radius_z = true
				
		# camera raycast
		var space_state = get_world().direct_space_state
		
		"""var result = space_state.intersect_ray(self.translation, Vector3(player.translation))
		var ray_obj = result["collider"]
		# print(result["collider"].name)
		
		if ray_obj.name == "StaticBody": # change intersecting object albedo/transperancy
			var material = ray_obj.get_node("Wall").get_surface_material(0)
			material.albedo_color = Color(1,200,1,0)
			ray_obj.get_node("Wall").set_surface_material(0, material)
			# material.albedo_color = Color(200,50,10,200)
			# material.albedo_color = Color(material.albedo_color.r,material.albedo_color.g,material.albedo_color.b,0)
			print(ray_obj.get_node("Wall").get_surface_material(0).albedo_color)"""

# translate(Vector3())
# 
