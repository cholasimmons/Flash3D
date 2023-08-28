extends VehicleBody3D

signal speeds(rpml: float, rpmr: float, linear: float)

@export var Max_Engine_Force := 5000.0
@export var Max_Brake_Force := 5.0
@export var Max_Steer_Angle := 0.9

@export var Max_Torque := 500
@export var Max_RPM := 5000


@export var Steer_Speed := 2.0

var steer_target := 0.0
var steer_angle := 0.0

var mouse_x := 0.0

var minSteerSensitivity: float = 0.05 # Minimum sensitivity when slow or stationary
var maxSteerSensitivity: float = 0.2  # Maximum sensitivity when fast
var speedThreshold: float = 10.0  # Speed above which sensitivity becomes max
var speedMultiplier: float      # Calculated sensitivity multiplier based on speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var throttle_val = Input.get_axis("ui_down","ui_up")
	var rpmL = abs($RL.get_rpm())
	$RL.engine_force = throttle_val * (Max_Torque * (1 - rpmL / Max_RPM))
	var rpmR = abs($RR.get_rpm())
	$RR.engine_force = throttle_val * (Max_Torque * (1 - rpmR / Max_RPM))

	speeds.emit(floor(rpmL),floor(rpmR),floor(linear_velocity.length()))


	steer_target = Input.get_axis("ui_right","ui_left")
	# print_debug(steer_target)

	speedMultiplier = lerp(minSteerSensitivity, maxSteerSensitivity, linear_velocity.length() / speedThreshold)	
	steering = lerp(steering, steer_target * Max_Steer_Angle, speedMultiplier)
	
func steer():
	pass

func _on_mouse_motion(event: InputEventMouseMotion) -> void:
	# var rotation = wheelNode.rotation_degrees
	# rotation.y -= event.relative.x * speedMultiplier
	# wheelNode.rotation_degrees = rotation
	pass
