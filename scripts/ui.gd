extends CanvasLayer

var lowest = -117.5;
var highest = 117.5;
# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/Needle.rotation_degrees = lowest;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# print_debug('vroom!')

func _on_actor_on_click(rcv:int):
	print('UI received signal. ',rcv);
	var current = lowest + rcv
	if(current and current < highest):
		$MarginContainer/Needle.rotation_degrees = current
	else:
		$MarginContainer/Needle.rotation_degrees = lowest

func _on_simpleVehicle_rpm(rpmL: float, rpmR: float, linear: float):
	$MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label2.text = 'RPM Left: '+str(rpmL)
	$MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label3.text = 'RPM Right: '+str(rpmR)
	$MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label4.text = 'Speed: '+str(linear)
	$CenterContainer/Needle.rotation_degrees = lowest + (rpmL / 10)
	
