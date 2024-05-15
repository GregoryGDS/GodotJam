extends Sprite2D

var mouse_offset = Vector2.ZERO
var dragging = false

const TPE_SPRITE_NAME = "CarteBleu"

var overlapping_sprite
var mouse_inside: bool

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	if Input.is_action_pressed("leftclick") and mouse_inside:
		set_global_position(get_global_mouse_position() - mouse_offset)


func _unhandled_input(event):
	if event.is_action_pressed("leftclick"):
		mouse_offset = get_global_mouse_position() - global_position
		


func update_overlapping_sprite():
	var bodies = $Area2D.get_overlapping_bodies()

	for body in bodies:
		if body.get_name() == TPE_SPRITE_NAME:
			overlapping_sprite = body
			return
	overlapping_sprite = null


func _on_area_2d_mouse_entered():
	mouse_inside = true


func _on_area_2d_mouse_exited():
	mouse_inside = false

