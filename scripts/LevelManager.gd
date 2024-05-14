extends Node2D

var lvArray:Array
var cheminDos:String;


# Called when the node enters the scene tree for the first time.
func _ready():
	lvArray = DirAccess.get_files_at(cheminDos);
	var random = lvArray.pick_random()
	var cheminLV = cheminDos + str(random)
	
	#var scene = load cheminLV
	#%TextureRectMask.add_child(scene.Instantiate())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
