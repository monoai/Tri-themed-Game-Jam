extends "res://Scripts/Buildings.gd"

var food_soldiers = 0
var food_gen = 0

func _ready():
	pass # Replace with function body.

func _on_Village_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		action_menu()
	pass # Replace with function body.

func action_menu():
	if !Utils.selected:
		$BuildingSprite.use_parent_material = true
		Utils.selected = self
		if Resources.food % 20:
			Resources.food -= 20
			Resources.total_soldier += 1
		else:
			print("Not divisible by 20")
		
	elif Utils.selected == self:
		$BuildingSprite.use_parent_material = false
		Utils.selected = null
		World.from_building = Vector2(0,0)
		$SoldierAmount.set_text("Food Soldiers: " + str(food_soldiers))
		
	elif Utils.selected:
		World.to_building = position
		if Utils.selected.soldiers_held > 0:
			Utils.selected.soldiers_held -= 1
			Utils.selected.get_node("SoldierAmount").set_text("Soldiers: " + str(Utils.selected.soldiers_held))
			World.pass_pos()
	pass

func _on_Village_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		food_soldiers += 1
		$SoldierAmount.set_text("Food Soldiers: " + str(food_soldiers))
		body.queue_free()
	pass # Replace with function body.

func foodGeneration():
	if food_soldiers > 0:
		food_gen = food_soldiers
		Resources.food += food_gen
		print("Sawmill success")
	pass

func _on_Timer_timeout():
	foodGeneration()
	pass # Replace with function body.
