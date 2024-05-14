extends Line2D

@export var lenght = 50;
var point = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	#var animation_player = $AnimationPlayer

	print("ALED BODEL")
	#%animation_player.play("DrawLine")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position= Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	
	add_point(point)



