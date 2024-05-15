extends Node2D

func _ready():
	# Définit la durée initiale du timer
	randomize_timer()
	#onready var timer = get_node("Timer") # Assurez-vous de remplacer "path/to/your/timer_node" par le chemin correct vers votre nœud Timer
	#text = str(timer.wait_time) # Met à jour le texte du label avec le temps restant du timer

func randomize_timer():
	# Génère un nombre aléatoire entre 30 et 50 secondes
	var random_time = randi_range(30, 50)
	$Timer.wait_time = random_time
	$Timer.start()



func _process(delta):
	$Camera2D/Label.set_text(str(int($Timer.time_left)))
