extends CharacterBody2D

@export var movementSpeed : float = 100;

@onready var money_ui = self.get_parent().get_node("money_ui")
var money : int

var items_dict = {
	"milk" : 0,
	"crops" : 0,
}

func _ready():
	money = 100
	money_ui.text = str(money)

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
		
	velocity = input_direction * movementSpeed;
	
	move_and_slide()

func _process(delta):
	pass

func uptade_money_ui():
	money_ui.text = str(money)
