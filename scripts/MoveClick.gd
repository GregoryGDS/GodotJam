extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
func _on_mouse_entered(): # input pickable à activer
	print("sur move click");


func _on_timer_timeout():
	#queue_free(); #supprimer le noeud, equivalent destroy
	scale *= 2;
