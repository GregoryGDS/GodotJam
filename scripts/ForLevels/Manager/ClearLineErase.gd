extends Node2D

@onready var line_2d = $Line2D
@onready var animation_player = $BaseLine/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	

func StartAnim():
	line_2d.viderLine()
	animation_player.play("moveErase")
	
func StopAnim():
	animation_player.stop()
