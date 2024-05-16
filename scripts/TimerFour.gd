extends Node2D

@export var anim: AnimatedSprite2D
var random_time

func _ready():
	# Définit la durée initiale du timer
	randomize_timer()
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
		else:
			print ("lose")
	# Reste a faire : Détecter quand le joueur clique
	# Vérifier si anime.frame == 2 (la frame verte), si c'est le cas
	# on gagne, sinon on perd


func update_animation():
	anim.frame =  remap($Timer.time_left, 0, random_time, 5, 0)
