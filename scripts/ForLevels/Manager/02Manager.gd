extends Node2D


@export var timer:float

signal win
signal loose

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalManager.timerGlobal = timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
