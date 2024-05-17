extends Node2D

@onready var score_text = $ScoreText


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://scripts/ForLevels/Manager/startMenuManager.tscn")
		
	pass


func setScoreText(score):
	score_text.text = str(score)
