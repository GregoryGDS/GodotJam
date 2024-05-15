extends Sprite2D


@export var piste: Area2D
var enter_time: float

var Time_accepted : float = 160

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
		
		if temps_trajet < Time_accepted:
			print("validate")
		else:
			print("too slow")
	
