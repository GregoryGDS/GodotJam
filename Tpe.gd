extends Sprite2D


@export var piste: Area2D
var enter_time: float

var TimeMax_accepted : float = 6000
var TimeMin_accepted: float = 5000

func _on_tpe_haut_area_entered(area):
	if area == piste:
		print("let's go")
		# vérifier que area == piste
		var enter_time = Time.get_ticks_msec()



func _on_tpe_bas_area_entered(area):
	if area == piste:
		var bottom_time = Time.get_ticks_msec()
		
		var temps_trajet: float = bottom_time - enter_time
		
		
		print(enter_time, "  |  ",  bottom_time , "  |  ", temps_trajet)
		
		if temps_trajet > TimeMin_accepted :
			$Camera2D/Label.set_text("too slow")
		elif   temps_trajet < TimeMax_accepted:
			$Camera2D/Label.set_text("too slow")
		else: 
			$Camera2D/Label.set_text("validate")
		
			
			
		
			
	
