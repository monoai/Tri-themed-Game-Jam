extends Node2D

var wood_gen = 0

func _ready():
	#print("yes is print")
	#print("subSoldheld: " + str(get_parent().soldiers_held))
	pass

func woodGeneration():
	var soldiers_held = get_parent().soldiers_held
	if soldiers_held > 0:
		wood_gen = soldiers_held
		Resources.wood += wood_gen
		print(Resources.wood)
		print("Sawmill success")
	pass


func _on_Timer_timeout():
	woodGeneration()
	pass # Replace with function body.
