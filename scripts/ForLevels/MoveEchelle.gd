extends AnimatedSprite2D

@onready var lvl_01_manager = $".."
@onready var _animated_sprite = %AnimatedSprite2D
@export var espaceUp:int;
@onready var audio_stream_player = $"../AudioStreamPlayer"

var lastAction:String;
var firstMove:bool;

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("moveUPLeft") || Input.is_action_just_pressed("moveUPRight")) && !firstMove:
		firstMove = true
		animation = "move"
		audio_stream_player.play()
	
	if Input.is_action_just_pressed("moveUPLeft") && lastAction!="moveUPLeft" && !lvl_01_manager.isStop:
		transform.origin.y -= espaceUp;
		lastAction="moveUPLeft";
		update_animation();
		audio_stream_player.play()

	if Input.is_action_just_pressed("moveUPRight") && lastAction!="moveUPRight" && !lvl_01_manager.isStop:
		transform.origin.y -= espaceUp;
		lastAction="moveUPRight";
		update_animation();
		audio_stream_player.play()
		
func update_animation():
	frame = (frame + 1) % 2;

