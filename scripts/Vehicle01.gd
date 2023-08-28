extends VehicleBody3D

@export var vehicle_name := 'Generic'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# apply force
	# for wheel in wheels:
		# wheel.apply_force(Vector3(engine_force * cos(steering_angle), 0, engine_force * sin(steering_angle)))

	# apply brakes
	# wheels[0].apply_force(Vector3(-brake_force, 0, 0))
