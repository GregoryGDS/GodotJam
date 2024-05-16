extends Node2D

@onready var lifes = $Lifes
@onready var num_stage = $numStage
@onready var name_level = $nameLevel



var arrayHeart: Array
@export var nbLifeCurrent:int = 3;


# Called when the node enters the scene tree for the first time.
func _ready():
	arrayHeart = lifes.get_children()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	DisplayLife()
	
	pass

func setNumStage(name):
	num_stage.text = name

func setNameLevel(name):
	name_level.text  = name

func setNbLifeRemind():
	nbLifeCurrent -= 1
	
func DisplayLife():
	for i in arrayHeart.size():
		if i > nbLifeCurrent-1:
			# voir ajouter un temps avant de cacher
			arrayHeart[i].visible = false
