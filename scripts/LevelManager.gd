extends Node2D

var lvArray:Array
@export var cheminDos:String;

@onready var texture_rect_mask = $TextureRectMask
@onready var menu_fin = $MenuFin # script sur noeud racine
@onready var transition = $Transition


@export var nbLifeCurrent:int = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	lvArray = DirAccess.get_files_at(cheminDos);
	
	var tscn_files = []

	for file in lvArray:
		if file.ends_with(".tscn"):
			tscn_files.append(file)
	
	var random = tscn_files.pick_random()
	var cheminLV = cheminDos + str(random)
	
	#var scene = load cheminLV
	#clear parent child
	#%texture_rect_mask.add_child(scene.Instantiate())
	
	print(cheminDos)
	print(random)
	print(cheminLV)

	#suppression des enfants
	for child in texture_rect_mask.get_children():
		child.queue_free()
	
	#charge la scene
	var new_scene = load(cheminLV).instantiate()
	if new_scene:
		texture_rect_mask.add_child(new_scene)
	else:
		print("Erreur : Impossible de charger la scène à partir de ", cheminLV)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
