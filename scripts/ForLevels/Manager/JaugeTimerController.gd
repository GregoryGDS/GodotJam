extends Node2D

@onready var eraser = $Eraser
@onready var timer = $Timer

@onready var color_rect = $ColorRect

var init_PosY:float

var totalTime:float
var timerInLevel:float

@export var initTimer:float
var initial_height: float = 406

# Called when the node enters the scene tree for the first time.
func _ready():
	# reset en brut
	color_rect.size.y = initial_height
	init_PosY = 65
	eraser.position.y = init_PosY
	
	timer.wait_time = initTimer
	totalTime = timer.wait_time;
	
	timer.start()
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	GlobalManager.timerLevel = timer.time_left
	
	proportion()
	
	if timer.is_stopped():
		GlobalManager.timerIsStop = true
		#tween.tween_property($Sprite2D, "size:y", Vector2(2,2),1).set_trans(Tween.TRANS_ELASTIC)
	
	
	pass

func proportion():
	# Calculate the proportion of the remaining time

	var proportion = timer.time_left / totalTime
	# Adjust the ColorRect height proportionally
	color_rect.size.y = initial_height * proportion
	
	eraser.position.y = init_PosY * (1+proportion)
