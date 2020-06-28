extends "res://Scripts/Buildings.gd"

var food_gen = 0


func _ready():
	temp_steel = "None"
	temp_wood = "None"
	buildname = "Village"
	add_to_group("non_combat")

func _on_Village_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		position_pass()

func _on_Village_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
		$SoldierAmount.set_text("Food Soldiers: " + str(soldiers_held))
		body.queue_free()
	elif body is enemy_class:
		body.attack()
		body.attacking = self

func foodGeneration():
	if soldiers_held > 0:
		food_gen = soldiers_held
		Resources.food += food_gen
		#print("Food success")
	pass

func _on_Timer_timeout():
	foodGeneration()
	pass # Replace with function body.
