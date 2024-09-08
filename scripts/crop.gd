extends Area2D

var colliding_with_player : bool

func _ready():
	colliding_with_player = false
	
func _process(delta):
	if (colliding_with_player && Input.get_action_strength("interact")):
		queue_free()

func _on_body_entered(body):
	colliding_with_player = true

func _on_body_exited(body):
	colliding_with_player = false
