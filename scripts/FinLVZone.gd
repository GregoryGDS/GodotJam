extends Area2D

@onready var lvl_01_Manager = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_entered(area):
	#label.text = "win";
	print("ok dans area fin lv");
	lvl_01_Manager.isFinish = true;#pour envoyer dans 01manager
