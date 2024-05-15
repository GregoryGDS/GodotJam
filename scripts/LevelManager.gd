extends Node2D

var lvArray:Array
var cheminDos:String;

@onready var texture_rect_mask = $TextureRectMask
@onready var menu_fin = $MenuFin # script sur noeud racine
@onready var transition = $Transition


@export var nbLifeCurrent:int = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	lvArray = DirAccess.get_files_at(cheminDos);
	var random = lvArray.pick_random()
	var cheminLV = cheminDos + str(random)
	
	#var scene = load cheminLV
	#clear parent child
	#%texture_rect_mask.add_child(scene.Instantiate())
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
