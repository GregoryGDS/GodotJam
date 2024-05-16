extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#print("hello world help meeee");
	exoTuto();
	
	var cpt:int = 0;
	
	for node in get_children():
		if node is RigidBody2D:
			cpt+=1
	
	#print("nb node rigidbody : ", cpt);
	
	%Label.text = str(cpt);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func exoTuto():
	# Variables
	var ma_var;
	var mon_int:int;
	
	# Conditions
	if ma_var:
		print("true");
	else:
		print("false");

	# Boucles
	while mon_int < 10:
		mon_int += 1;
		
	for i in mon_int: #int ou array
		print("i : ", i);
