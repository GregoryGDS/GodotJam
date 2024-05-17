extends Area2D

# Charger le préfabriqué de l'objet à faire apparaître
@export var rangeRadius: float = 30
@export var moveSpeed: float = 100.0
@export var moveRange: Rect2 = Rect2(Vector2(-200, -200), Vector2(400, 400))
@onready var lvl_02_mouche = $".."
@onready var tapette_parent = $"../Tapette Parent"

# Déclaration des variables pour stocker les références aux sprites
var disabled_sprite = null
var enabled_sprites = []  # Utilisation d'une liste pour stocker plusieurs sprites
var targetPosition: Vector2
var  dead : bool = false

func _ready():
	# Récupérer les références aux sprites
	set_process(true)
	generateNewTarget()

func _on_mouse_entered():
	print("mouse enter")
	#if Input.is_action_just_pressed("ClicLeft"):
		#print(get_local_mouse_position())

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Mouse Click/Unclick at: ", event.position)
		tapette_parent.global_position = event.position
		
		var object_global_position = global_position # La position globale de votre objet
		var distance = object_global_position.distance_to(event.position)
		if !lvl_02_mouche.isStop:
			if distance <= rangeRadius:
				lvl_02_mouche.isFinish = true;
				print("Le clic est à l'intérieur du rayon.")
				$AileDroite.visible = false
				$AileGauche.visible = false
				$Tete.visible = false
				
				print("Sprite désactivé.")
				# Activer les nouveaux sprites
				$Mouchepaf.visible = true
				print("Sprites activés.")
				dead = true
				print(dead)
			else:
				print("Le clic est à l'extérieur du rayon.")
				$AileDroite.visible = true
				$AileGauche.visible = true
				$Tete.visible = true
				$Mouchepaf.visible = false

func _process(delta):
	if (!dead):
		var velocity = (targetPosition - global_position).normalized() * moveSpeed * delta
		global_position += velocity
		
		if global_position.distance_to(targetPosition) < 10.0:
			generateNewTarget()

func generateNewTarget():
	if (!dead):
		targetPosition = Vector2(randf_range(moveRange.position.x, moveRange.size.x),randf_range(moveRange.position.y, moveRange.size.y))
