extends Camera3D

@onready var target = get_node("../SimpleVehicle")

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug(target)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# lerp(transform.origin, target.get_transform(), 0.7 * delta)
	pass
