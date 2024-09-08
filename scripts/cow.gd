extends Area2D
@onready var statusBubble = $status_bubble

@export var move_speed : float = 5.0
@export var move_dir : Vector2

var start_pos : Vector2
var count : int
var colliding_with_player : bool
var milkable : bool
var milk_procces : float

func _ready():
	start_pos = global_position
	count = 0;
	colliding_with_player = false
	milkable = false;
	milk_procces = 0
	statusBubble.visible = false

func _process(delta):
	if(count % (100*randi_range(1,5)) == 0):
		move_dir = Vector2(randi_range(-1,1), randi_range(-1,1))

	if(count % 50 == 0 && !milkable):
			milk_procces += 0.1
	
	global_position += move_dir * move_speed * delta
	count = count + 1;
	
	if(milk_procces >= 1.0):
		milkable = true
		status_bubble()
	
	if(Input.get_action_strength("interact") && colliding_with_player && milkable):
		milkable = false
		milk_procces = 0
		statusBubble.visible = false
		colliding_with_player = false
	

func _on_body_entered(body):
	colliding_with_player = true

func _on_body_exited(body):
	colliding_with_player = false
	
func status_bubble():
	statusBubble.visible = true
