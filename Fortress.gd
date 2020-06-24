extends "res://Scripts/Buildings.gd"

var buildname = "Fortress"

func _ready():
	temp_steel = "None"
	temp_wood = "None"
	soldiers_held = Resources.total_soldier
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	pass # Replace with function body.

func _process(_delta):
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))

func _on_Fortress_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		position_pass()

func _on_Fortress_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		if body.res_held > 0:
			Resources.steel += body.res_held
		soldiers_held += 1
		body.queue_free()
	elif body is enemy_class:
		body.attack()
