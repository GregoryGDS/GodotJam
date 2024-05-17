extends Node2D

@export var anim: AnimatedSprite2D
@onready var Burgir : Sprite2D = $Burger
@onready var BurgirLoose = $BurgerLoose

@onready var Fume : Sprite2D = $Fume
@onready var Fume2 : Sprite2D = $Fume2
@onready var Fume3 : Sprite2D = $Fume3
@onready var Fume4 : Sprite2D = $Fume4
@onready var audio_fourding = $fourding
@onready var audio_fourcontinue = $fourcontinue
@onready var jauge_timer = $JaugeTimer

var random_time
@export var min_time:float
@export var max_time:float


var isFinish:bool
var isStop:bool
var isLoose:bool

signal win
signal loose

func _ready():
	isFinish = false
	isStop = false
	isLoose = false
	
	# Définit la durée initiale du timer
	randomize_timer()
	audio_fourcontinue.play()
	Burgir.visible=false
	BurgirLoose.visible =false
	Fume.visible=false
	Fume2.visible=false
	Fume3.visible=false
	Fume4.visible=false
	#onready var timer = get_node("Timer") # Assurez-vous de remplacer "path/to/your/timer_node" par le chemin correct vers votre nœud Timer
	#text = str(timer.wait_time) # Met à jour le texte du label avec le temps restant du timer


func randomize_timer():
	# Génère un nombre aléatoire entre 30 et 50 secondes
	random_time = randi_range(min_time, max_time)
	#$Timer.wait_time = random_time
	#$Timer.start()
	
	print(int(random_time * 0.8))
	print(int(random_time * 0.5))
	print(int(random_time * 0.3))
	print(int(random_time * 0.1))



func _process(_delta):
	
	#$Camera2D/Label.set_text(str(int(jauge_timer.timer.time_left)))
	
	if (isLoose && !isStop):
		#jauge_timer.timer.stop()# à modif
		print("-- ISLOOSE -- ")
		audio_fourcontinue.stop()
		isStop = true
		loose.emit()
		jauge_timer.timer.stop()
		BurgirLoose.visible = true
		Fume.visible=true
		Fume2.visible=true
		Fume3.visible=true
		Fume4.visible=true
	else:
		update_animation()	
	
		if isFinish && !isStop:
			isStop = true;
			win.emit()
			jauge_timer.timer.stop()
			print("-- fini gagné -- ")
			#son gg
		elif (GlobalManager.timerIsStop && !isStop): # = timer fini donc stop
			isStop = true
			loose.emit()
			BurgirLoose.visible = true
			audio_fourcontinue.stop()
			print("-- fini perdu timer -- ")
	

	if (!isStop && !isLoose):
		if Input.is_action_pressed("leftclick"):
			if anim.frame == 2 :
				print("win")
				isFinish = true
				audio_fourding.play()
				Burgir.visible=true
				BurgirLoose.visible=false
				Fume.visible=false
				Fume2.visible=false
				Fume3.visible=false
				Fume4.visible=false
				
			else:
				isLoose = true
				print ("lose")
				Fume.visible=true
				Fume2.visible=true
				Fume3.visible=true
				Fume4.visible=true
	
		if anim.frame == 2 :
			Fume.visible=true
		if anim.frame==3 :
			Fume3.visible=true
		if anim.frame == 4:
			Fume4.visible=true
			Fume2.visible=true
		# Reste a faire : Détecter quand le joueur clique
		# Vérifier si anime.frame == 2 (la frame verte), si c'est le cas
		# on gagne, sinon on perd


func update_animation():
	anim.frame =  remap(jauge_timer.timer.time_left, 0, random_time, 5, 0)
