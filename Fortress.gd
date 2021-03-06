extends "res://Scripts/Buildings.gd"

func _ready():
	buildname = "Fortress"
	temp_steel = 0
	temp_wood = 0
	soldiers_held = Resources.total_soldier
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	pass # Replace with function body.

func _process(_delta):
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))

func _on_Fortress_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		position_pass()

func _on_Fortress_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		Resources.steel += body.steel_held
		Resources.wood += body.wood_held
		soldiers_held += 1
		body.queue_free()
	elif body.is_in_group("enemy"):
		body.attack()
		body.attacking = self
