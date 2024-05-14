extends AnimatedSprite2D

@onready var label = %Label

var lastAction:String;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("moveUPLeft") && lastAction!="moveUPLeft":
		transform.origin.y -= 10;
		lastAction="moveUPLeft";
		update_animation();


	if Input.is_action_just_pressed("moveUPRight") && lastAction!="moveUPRight":
		transform.origin.y -= 10;
		lastAction="moveUPRight";
		update_animation();

func update_animation():
	frame = (frame + 1) % 3;

	
func _on_body_entered(body): #  collider other
	label.text = "win";
	print("ok dans sprite");
	
	
	


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
