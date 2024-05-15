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
	random_time = randi_range(10, 20)
	$Timer.wait_time = random_time
	$Timer.start()
	
	print(int(random_time * 0.8))
	print(int(random_time * 0.5))
	print(int(random_time * 0.3))
	print(int(random_time * 0.1))



func _process(delta):
	$Camera2D/Label.set_text(str(int($Timer.time_left)))
	if $Timer.time_left < (int(random_time * 0.8)):
		print("ya")


func update_animation():
	anim.frame = (anim.frame + 1) % 5; # % nb frame
