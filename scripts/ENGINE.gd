extends RigidBody3D

signal engine_start(val:bool)

var is_on:bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	is_on = true

func _input(event):
	if(is_on and event.is_action_pressed("ui_up")):
		rev()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	engine_start.emit(is_on)

func rev():
	print('revving')
