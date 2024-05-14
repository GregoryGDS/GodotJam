extends Node2D

@export_file("*.tscn") var chemin;
#tout est public avec export 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("spawn"):
# instanciation de scene
		
		var scene:= load(chemin);
		var instance = scene.instantiate();
		add_child(instance);
		
		

		
