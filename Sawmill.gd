extends Node2D

var wood_gen = 0

func _ready():
	#print("yes is print")
	#print("subSoldheld: " + str(get_parent().soldiers_held))
	add_to_group("sawmill")
	pass

func woodGeneration():
	var soldiers_held = get_parent().soldiers_held
	wood_gen = soldiers_held
	if soldiers_held > 0:
		var formula = (wood_gen * (Resources.wood_upgrade))
		get_parent().temp_wood += formula
		#print("Sawmill success")
	pass


func _on_Timer_timeout():
	woodGeneration()
	pass # Replace with function body.
