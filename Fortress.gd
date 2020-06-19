extends "res://Scripts/Buildings.gd"

func _ready():
	soldiers_held = Resources.total_soldier
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	Utils.fortress_pos = position
	pass # Replace with function body.

func _process(delta):
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))

func _on_Fortress_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		position_pass()

func _on_Fortress_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
		body.queue_free()
	elif body is enemy_class:
		body.attack()
