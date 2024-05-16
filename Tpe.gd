extends Sprite2D
@onready var label = $"../Camera2D/Label"
@onready var tpe_anim = $"../TpeAnim"
@onready var audio_Correct = $"../CardCorrect"
@onready var audio_Uncorrect = $"../CardUncorrect"
@export var piste: Area2D
var enter_time: float

var TimeMax_accepted : float =100
var TimeMin_accepted: float = 50

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
			if temps_trajet < TimeMax_accepted :
				label.set_text("validate")
				print("validated")
				tpe_anim.set_frame(1)
				audio_Correct.play()
			else :
				label.set_text("too Slow")
				tpe_anim.set_frame(0)
				print("slow")
				audio_Uncorrect.play()
		else: 
			print("fast")
			label.set_text("too fast")
			tpe_anim.set_frame(0)
			audio_Uncorrect.play()
			
		enter_time =  0
		bottom_time = 0
			
			
		
			
	
