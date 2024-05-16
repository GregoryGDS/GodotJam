extends Node2D

@export var anim: AnimatedSprite2D
@onready var Burgir : Sprite2D = $Burger
@onready var Fume : Sprite2D = $Fume
@onready var Fume2 : Sprite2D = $Fume2
@onready var Fume3 : Sprite2D = $Fume3
@onready var Fume4 : Sprite2D = $Fume4
@onready var audio_fourding = $fourding
@onready var audio_fourcontinue = $fourcontinue
var random_time

func _ready():
	# Définit la durée initiale du timer
	randomize_timer()
	audio_fourcontinue.play()
	Burgir.visible=false
	Fume.visible=false
	Fume2.visible=false
	Fume3.visible=false
	Fume4.visible=false
	#onready var timer = get_node("Timer") # Assurez-vous de remplacer "path/to/your/timer_node" par le chemin correct vers votre nœud Timer
	#text = str(timer.wait_time) # Met à jour le texte du label avec le temps restant du timer


func randomize_timer():
	# Génère un nombre aléatoire entre 30 et 50 secondes
	random_time = randi_range(5, 10)
	$Timer.wait_time = random_time
	$Timer.start()
	
	print(int(random_time * 0.8))
	print(int(random_time * 0.5))
	print(int(random_time * 0.3))
	print(int(random_time * 0.1))



func _process(_delta):
	$Camera2D/Label.set_text(str(int($Timer.time_left)))
	update_animation()
	if Input.is_action_pressed("leftclick"):
		if anim.frame == 2 :
			print("win")
			audio_fourding.play()
			Burgir.visible=true
			Fume.visible=false
			Fume2.visible=false
			Fume3.visible=false
			Fume4.visible=false
			
		else:
			print ("lose")
	
	
	
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
	anim.frame =  remap($Timer.time_left, 0, random_time, 5, 0)
