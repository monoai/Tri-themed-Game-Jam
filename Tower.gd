extends Area2D

onready var World = get_node("/root/World/")

var soldiers_held = 0
var activeClick = 0
var destinationClick = 0

func _ready():
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	add_to_group("tower") #Groups thing that I'm testing out
	pass # Replace with function body.

func _process(_delta):
	if World.pass_done == 1:
		get_tree().call_group("tower", "anti_glow") #This piece of shit might be buggy in the future, too bad.
		World.pass_done = 0
	else:
		pass
	pass

func _on_Tower_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		var buildingPos = self.position
		
		if activeClick == 1:
			$TowerSprite.use_parent_material = false
			activeClick = 0
			if soldiers_held > 0:
				soldiers_held += 1
				$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
			else:
				$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
			if World.from_building != Vector2(0,0) && World.to_building == Vector2(0,0):
				World.from_building = Vector2(0,0)
				print("World.from: " + str(World.from_building))

		elif activeClick == 0:
			$TowerSprite.use_parent_material = true
			activeClick = 1
			if World.from_building == Vector2(0,0) && World.to_building == Vector2(0,0):
				if soldiers_held > 0:
					World.from_building = buildingPos
					print("World.from: " + str(World.from_building))
					soldiers_held -= 1
					$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
				else:
					print("World.from: " + "No soldiers, no spawn")
			elif World.from_building != Vector2(0,0) && World.to_building == Vector2(0,0):
				print("World.to: " + str(World.to_building))
				$TowerSprite.use_parent_material = false
				World.to_building = buildingPos
				activeClick = 0
				destinationClick = 1
				get_tree().call_group("tower", "anti_glow") #This piece of shit might be buggy in the future, too bad.
				pass
				#else:
				#	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
				#	World.from_building = Vector2(0,0)
				#	$TowerSprite.use_parent_material = false
				#	activeClick = 0
				#	pass
	pass # Replace with function body.

func _on_Tower_body_entered(body):
	if body.is_in_group("soldier") && destinationClick == 1:
		print("Soldier successfully got!")
		soldiers_held += 1
		destinationClick = 0
		$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		body.queue_free()
		
	pass # Replace with function body.

func _on_Tower_body_exited(body):
	if body.is_in_group("soldier"):
		print("tries to exit")
	pass # Replace with function body.

func anti_glow(): #A function purely to fuckin' remove the glow on buildings since somehow due to the way I programmed shit (making every code exclusive to itself *logically*) it doesn't remove and make the from_buildings inactive, therefore I have to call every motherfucking tower group and hard-code the inactive state.
	activeClick = 0
	$TowerSprite.use_parent_material = false
	pass
