extends Line2D

@export var lenght = 50;
var point = Vector2();

@export  var baseline:Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#var animation_player = $AnimationPlayer
	
	#%animation_player.play("DrawLine")
	
	add_point(global_transform.affine_inverse() * baseline.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position= Vector2(727,-127) #point de départ
	global_rotation = 0

	point = global_transform.affine_inverse() * baseline.global_position
	#point = global_position
	add_point(point)

func viderLine():
	clear_points()

