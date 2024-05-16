extends Sprite2D
@onready var label = $"../Camera2D/Label"
@onready var tpe_anim = $"../TpeAnim"


@export var piste: Area2D
var enter_time: float

var TimeMax_accepted : float =50
var TimeMin_accepted: float = 100

func _on_tpe_haut_area_entered(area):
	if area == piste:
		print("let's go")
		# vérifier que area == piste
		enter_time = Time.get_ticks_msec()



func _on_tpe_bas_area_entered(area):
	if area == piste:
		var bottom_time = Time.get_ticks_msec()
		
		var temps_trajet: float = bottom_time - enter_time
		
		
		print(enter_time, "  |  ",  bottom_time , "  |  ", temps_trajet)
		
		if temps_trajet > TimeMin_accepted :
			label.set_text("too slow")
			tpe_anim.set_frame(0)
		elif   temps_trajet < TimeMax_accepted:
			label.set_text("too slow")
			tpe_anim.set_frame(0)
		else: 
			label.set_text("validate")
			tpe_anim.set_frame(1)
		enter_time =  0
		bottom_time = 0
			
			
		
			
	
