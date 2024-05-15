extends Area2D

# Charger le préfabriqué de l'objet à faire apparaître
@export var new_object_prefab = preload("res://scenes_prefabs/mouchepaf.tscn")
@export var rangeRadius: float = 30


var disabled_sprite = null
var enabled_sprite = null


func _ready():
	
	disabled_sprite = getNode(sprite_to_disable_path)
	enabled_sprite = getNode(sprite_to_enable_path)
	
	print(global_position)
	# Connecter le signal "input_event" de tous les enfants Sprite à cette fonction
	for child in get_children():
		if child is Sprite2D:
			child.connect("input_event", Callable(self, "_on_sprite_input_event"))

#func _on_sprite_input_event(viewport, event, shape_idx):
	## Vérifier si l'événement est un clic gauche de la souris
	#
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		## Supprimer le sprite cliqué
		#disabled_sprite.hide()
			## Activer le nouveau sprite
		#enabled_sprite.show()

func _on_mouse_entered():
	print("baba")
	if Input.is_action_just_pressed("ClicLeft"):
		print("click dans mouche tamere")
		print(get_local_mouse_position())

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Mouse Click/Unclick at: ", event.position)
		print("CLICK JPP")
		
		var object_global_position = global_position # La position globale de votre objet
		var distance = object_global_position.distance_to(event.position)
		

		if distance <= rangeRadius:
			print("Le clic est à l'intérieur du rayon.")
			
			disabled_sprite.visible = false
			print("Sprite désactivé.")
			# Activer le nouveau sprite
			enabled_sprite.visible = true
			print("Sprite activé.")
			
		else:
			print("Le clic est à l'extérieur du rayon.")
