extends Node2D

@onready var area_2d___fin_lv = $"Area2D - fin LV"

var isFinish:bool
var isStop:bool

@export var timer:float

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalManager.timerGlobal = timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("testTimer"):
		timer -= 1
	
	if GlobalManager.timerGlobal < 0:
		isStop = true
		#son echec
	
	if isFinish && !isStop:
		isStop = true;
		#son gg

func getIsFinish():
	return isFinish
