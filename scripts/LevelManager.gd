extends Node2D

var lvArray:Array
var tscn_files:Array
var numLvl
var nameLvl

@export var cheminDos:String;
@onready var texture_rect_mask = $TextureRectMask
@onready var menu_fin = $MenuFin # script sur noeud racine
@onready var transition = $Transition

@onready var anim_line_erase = $animLineErase

const ANIM_LINE_ERASE = preload("res://scenes_prefabs/LD/anim_line_erase.tscn")

#@export var nbLifeCurrent:int = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	lvArray = DirAccess.get_files_at(cheminDos);
	
	tscn_files = []

	for file in lvArray:
		if file.ends_with(".tscn"):
			tscn_files.append(file)
		
	randomScene()
	
	transition.setNumStage(numLvl)
	transition.setNameLevel(nameLvl)
	
	#ANIM_LINE_ERASE.get_script().stop()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("testTimer"):
		transition.setNbLifeRemind()
	
	pass


func randomScene():
	var random = tscn_files.pick_random()
	var cheminLV = cheminDos + str(random)
	

	
	#var scene = load cheminLV
	#clear parent child
	#%texture_rect_mask.add_child(scene.Instantiate())
	
	print(cheminDos)
	print(random)
	print(cheminLV)
	print(tscn_files)

	var splitArray = random.split("_")
	numLvl = splitArray[0]
	nameLvl = splitArray[1].split(".")[0]
	
	
	#suppression des enfants
	for child in texture_rect_mask.get_children():
		child.queue_free()
		
	#charge la scene
	var new_scene:Node2D = load(cheminLV).instantiate()
	if new_scene:
		texture_rect_mask.add_child(new_scene)
		#print("etat level : ", new_scene.get_script())
		# set bool pour animation gomme
		# set vie
		# recharge scene
	else:
		print("Erreur : Impossible de charger la scène à partir de ", cheminLV)

