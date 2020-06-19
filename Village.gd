extends "res://Scripts/Buildings.gd"

var food_gen = 0

func _ready():
	add_to_group("non_combat")

func _on_Village_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		position_pass()

func action_menu():
	if !Utils.selected:
		$BuildingSprite.use_parent_material = true
		Utils.selected = self
		if Resources.food / 20 && Resources.food > 0:
			Resources.food -= 20
			get_node("/root/World/Fortress").soldiers_held += 1
		else:
			print("Not divisible by 20")
		
	elif Utils.selected == self:
		$BuildingSprite.use_parent_material = false
		Utils.selected = null
		World.from_building = position
		$SoldierAmount.set_text("Food Soldiers: " + str(soldiers_held))
		
	elif Utils.selected.is_in_group("non_combat"):
		World.to_building = position
		if Utils.selected.soldiers_held > 0:
			Utils.selected.soldiers_held -= 1
			Utils.selected.get_node("SoldierAmount").set_text("Soldiers: " + str(Utils.selected.soldiers_held))
			World.pass_pos()
	pass

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
