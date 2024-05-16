extends Node2D

@onready var area_2d___fin_lv = $"Area2D - fin LV"
@onready var jauge_timer = $JaugeTimer

var isFinish:bool # arriver ligne
var isStop:bool

@export var timer:float

signal win
signal loose


# Called when the node enters the scene tree for the first time.
func _ready():
	#GlobalManager.timerLevel = timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("testTimer"):
		timer -= 1
	
	if isFinish && !isStop:
		isStop = true;
		win.emit()
		jauge_timer.timer.stop()
		#son gg
	elif GlobalManager.timerIsStop && !isStop: # = timer fini donc stop
		isStop = true
		loose.emit()
		#son echec
	


func getIsFinish():
	return isFinish


#func _on_area_2d__fin_lv_area_entered(area):
	##condition
	#win.emit()
