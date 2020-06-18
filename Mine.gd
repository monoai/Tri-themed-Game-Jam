extends Node2D

var steel_gen = 0

func _ready():
	#print("yes is print")
	#print("subSoldheld: " + str(get_parent().soldiers_held))
	pass

func steelGeneration():
	var soldiers_held = get_parent().soldiers_held
	if soldiers_held > 0:
		steel_gen = soldiers_held
		Resources.steel += steel_gen
		print(Resources.steel)
		print("Mine success")
	pass


func _on_Timer_timeout():
	steelGeneration()
	pass # Replace with function body.
