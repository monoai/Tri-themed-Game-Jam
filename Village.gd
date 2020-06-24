extends "res://Scripts/Buildings.gd"

var food_gen = 0

var buildname = "Village"

func _ready():
	temp_steel = "None"
	temp_wood = "None"
	add_to_group("non_combat")

func _on_Village_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		position_pass()

func _on_Village_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
		$SoldierAmount.set_text("Food Soldiers: " + str(soldiers_held))
		body.queue_free()
	elif body is enemy_class:
		body.attack()

func foodGeneration():
	if soldiers_held > 0:
		food_gen = soldiers_held
		Resources.food += food_gen
		#print("Food success")
	pass

func _on_Timer_timeout():
	foodGeneration()
	pass # Replace with function body.
