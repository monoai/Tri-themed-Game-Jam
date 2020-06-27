extends Node2D

var wood_gen = 0
onready var soldiers_held = get_parent().soldiers_held

func _ready():
	#print("yes is print")
	#print("subSoldheld: " + str(get_parent().soldiers_held))
	wood_gen = soldiers_held
	add_to_group("sawmill")
	pass

func woodGeneration():
	if soldiers_held > 0:
		get_parent().temp_wood += wood_gen
		#print("Sawmill success")
	pass


func _on_Timer_timeout():
	woodGeneration()
	pass # Replace with function body.
