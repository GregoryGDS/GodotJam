extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	var tween:= create_tween()
	tween.tween_property($Sprite2D, "scale", Vector2(2,2),1).set_trans(Tween.TRANS_ELASTIC)
	
	#$Sprite2D.scale *= 2;
	
