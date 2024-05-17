extends Node2D

var lvArray:Array
var tscn_files:Array
var numLvl
var nameLvl
var numStage = 0
var screen: bool = false
var gameOver:bool = false
var new_scene:Node2D
var cheminLV:String

@export var cheminDos:String;
@onready var texture_rect_mask = $TextureRectMask
@onready var menu_fin = $MenuFin # script sur noeud racine
@onready var transition = $Transition
@onready var timerScreen = $Timer

@onready var scene___trail_eraser = $"CanvasLayer- génération du mask/SubViewportContainer/SubViewport - texture substrat dynamique/scene - TrailEraser"
@onready var anim_line_erase = $animLineErase
@onready var firstTransition = $TextureRectMask/TransitionLV1

@onready var audio_game_over = $AudioGameOver
@onready var audio_victory = $AudioVictory
@onready var audio_loose = $AudioLoose

signal clearLineErase
#@export var nbLifeCurrent:int = 3;
@onready var jauge_timer = $Transition/JaugeTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	screen = true
	lvArray = DirAccess.get_files_at(cheminDos);
	# reset trail gomme => script à la racine
	tscn_files = []

	for file in lvArray:
		if file.ends_with(".tscn"):
			tscn_files.append(file)
	#randScene()
	#ChargeScene()
	#setTransition()
	
	#transition.setNumStage(str(numStage))
	#transition.setNameLevel(nameLvl)
	
	#ANIM_LINE_ERASE.get_script().stop()
	#jauge_timer.initTimer = timerScreen.wait_time;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if screen:
		startTimer()

		

func randScene():
	print("-----select rand scene-----") 
	var random = tscn_files.pick_random()
	cheminLV = cheminDos + str(random)

	var splitArray = random.split("_")
	numLvl = splitArray[0]
	nameLvl = splitArray[1].split(".")[0]
	
	new_scene = load(cheminLV).instantiate()
	new_scene.win.connect(onWin)
	new_scene.loose.connect(onLoose)
	
	
	
	
func ChargeScene():
	print("-----Load stage-----")
	#var random = tscn_files.pick_random()
	#var cheminLV = cheminDos + str(random)
	#
	##var scene = load cheminLV
	##clear parent child
	##%texture_rect_mask.add_child(scene.Instantiate())
	#
	##print(cheminDos)
	##print(random)
	##print(cheminLV)
	##print(tscn_files)
#
#
	#var splitArray = random.split("_")
	#numLvl = splitArray[0]
	#nameLvl = splitArray[1].split(".")[0]
	
	#suppression des enfants
	for child in texture_rect_mask.get_children():
		child.queue_free()

	print(texture_rect_mask.get_children())
	#charge la scene
	#new_scene = load(cheminLV).instantiate()
	
	#pattern observer

	# faire plus tard
	if new_scene:
		#texture_rect_mask.add_child(firstTransition)
		texture_rect_mask.add_child(new_scene)
		#print("etat level : ", new_scene.get_script())
		# set bool pour animation gomme
		# set vie
		# recharge scene
	else:
		print("Erreur : Impossible de charger la scène à partir de ", cheminLV)

func onWin():
	print("WIN LEVELS MANAGER")
	#timer
	audio_victory.play()
	scene___trail_eraser.StartAnim() # clear ligne et anim gomme 
	anim_line_erase.start() # anim gomme
	screen = true
	pass
	
func onLoose():
	print("LOOSE LEVELS MANAGER")
	#timer
	transition.setNbLifeRemind() # -1
	print("pv : ",transition.nbLifeCurrent)
	if transition.nbLifeCurrent <= 0:
		print("-----GAME OVER-----")
		audio_game_over.play()
		gameOver = true
		transition.visible = false;
	else:
		screen = true
		audio_loose.play()
	scene___trail_eraser.StartAnim()
	anim_line_erase.start()
	
	pass

func setTransition():
	numStage += 1
	print("numStage : ", numStage)
	transition.setNumStage(str(numStage))
	transition.setNameLevel(nameLvl)
	
	transition.SetInput(nameLvl)
	
	


func startTimer(): # timer transition
	if not timerScreen.is_stopped():
		return
	timerScreen.start()
	jauge_timer.start()
	print("-----START SCREEN-----")
	randScene()
	setTransition()

func _on_timer_timeout():
	scene___trail_eraser.line_2d.viderLine()
	#ChargeScene()
	screen = false
	
	print("-----END SCREEN-----")
	if !gameOver:
		ChargeScene()

