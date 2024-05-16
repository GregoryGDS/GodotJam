extends Node2D

var lvArray:Array
var tscn_files:Array
var numLvl
var nameLvl
var numStage = 0
var screen: bool = false

@export var cheminDos:String;
@onready var texture_rect_mask = $TextureRectMask
@onready var menu_fin = $MenuFin # script sur noeud racine
@onready var transition = $Transition
@onready var timerScreen = $Timer

@onready var scene___trail_eraser = $"CanvasLayer- génération du mask/SubViewportContainer/SubViewport - texture substrat dynamique/scene - TrailEraser"
@onready var anim_line_erase = $animLineErase


signal clearLineErase
#@export var nbLifeCurrent:int = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	lvArray = DirAccess.get_files_at(cheminDos);
	# reset trail gomme => script à la racine
	tscn_files = []

	for file in lvArray:
		if file.ends_with(".tscn"):
			tscn_files.append(file)
		
	randomScene()
	setTransition()
	
	#transition.setNumStage(str(numStage))
	#transition.setNameLevel(nameLvl)
	
	#ANIM_LINE_ERASE.get_script().stop()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if screen:
		startTimer()
		#print(timerScreen.time_left)

func randomScene():
	var random = tscn_files.pick_random()
	var cheminLV = cheminDos + str(random)
	

	
	#var scene = load cheminLV
	#clear parent child
	#%texture_rect_mask.add_child(scene.Instantiate())
	
	#print(cheminDos)
	#print(random)
	#print(cheminLV)
	#print(tscn_files)

	var splitArray = random.split("_")
	numLvl = splitArray[0]
	nameLvl = splitArray[1].split(".")[0]
	
	
	#suppression des enfants
	for child in texture_rect_mask.get_children():
		child.queue_free()
		
	#charge la scene
	var new_scene:Node2D = load(cheminLV).instantiate()
	print("-----Laod stage-----")
	new_scene.win.connect(onWin)
	new_scene.loose.connect(onLoose)
	#pattern observer
	
	if new_scene:
		texture_rect_mask.add_child(new_scene)
		#print("etat level : ", new_scene.get_script())
		# set bool pour animation gomme
		# set vie
		# recharge scene
	else:
		print("Erreur : Impossible de charger la scène à partir de ", cheminLV)

func onWin():
	print("WIN LEVELS MANAGER")
	scene___trail_eraser.StartAnim() # clear ligne et anim gomme 
	anim_line_erase.start() # anim gomme
	screen = true
	pass
	
func onLoose():
	print("LOOSE LEVELS MANAGER")
	transition.setNbLifeRemind() # -1
	if transition.nbLifeCurrent <= 0:
		print("-----GAME OVER-----")
	scene___trail_eraser.StartAnim()
	anim_line_erase.start()
	screen = true
	pass

func setTransition():
	numStage += 1
	transition.setNumStage(str(numStage))
	transition.setNameLevel(nameLvl)


func startTimer():
	if not timerScreen.is_stopped():
		return
	timerScreen.start()
	print("-----START SCREEN-----")

func _on_timer_timeout():
	scene___trail_eraser.line_2d.viderLine()
	screen = false
	print("-----END SCREEN-----")
	randomScene()
	setTransition()
