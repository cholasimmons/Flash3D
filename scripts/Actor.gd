extends CSGBox3D

signal on_click(value:int);

var speed = 0;

@onready var me = get_node('.')

# Called when the node enters the scene tree for the first time.
func _ready():
	# me.connect('_on_click', _on_actor_on_click, 'speed')
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if(event.is_action_pressed('ui_up')):
		increaseSpeed()
		print('Speed Up:,',speed)
		on_click.emit(speed)

func increaseSpeed():
	speed += (10)
