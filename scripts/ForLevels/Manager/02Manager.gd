extends Node2D


#@export var timer:float
@onready var jauge_timer = $JaugeTimer

var isFinish:bool # min 1 mouche hit
var isStop:bool

signal win
signal loose

# Called when the node enters the scene tree for the first time.
func _ready():
	isFinish = false
	isFinish = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if isFinish && !isStop:
		isStop = true;
		win.emit()
		jauge_timer.timer.stop()
		#son gg
	elif GlobalManager.timerIsStop && !isStop: # = timer fini donc stop
		isStop = true
		loose.emit()
		print("ici")
		#son echec
	pass
	
	
	
	
