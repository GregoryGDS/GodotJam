extends Sprite2D
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start():
	animation_player.play("moveErase")

func stop():
	animation_player.stop()
