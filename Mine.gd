extends Node2D

var steel_gen = 0

func _ready():
	#print("yes is print")
	#print("subSoldheld: " + str(get_parent().soldiers_held))
	pass

func steelGeneration():
	var soldiers_held = get_parent().soldiers_held
	steel_gen = soldiers_held
	if soldiers_held > 0:
		var formula = (steel_gen * (Resources.steel_upgrade))
		get_parent().temp_steel += formula
		#print("Mine success")
	pass


func _on_Timer_timeout():
	steelGeneration()
	pass # Replace with function body.
