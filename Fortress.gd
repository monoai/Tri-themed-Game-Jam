extends Area2D

onready var World = get_node("/root/World/")

var soldiers_held = 0
var activeClick = 0
var destinationClick = 0

func _ready():
	soldiers_held = Resources.max_soldier
	$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
	pass # Replace with function body.

func _process(_delta):
	if World.pass_done == 1: #This entire thing could possibly be removed, please find a way to optimize it, it looks dumb.
		$FortressSprite.use_parent_material = false
		activeClick = 0
		get_tree().call_group("tower", "anti_glow")
		World.pass_done = 0
	else:
		pass
	pass


func _on_Fortress_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		var buildingPos = self.position
		
		if activeClick == 1:
			$FortressSprite.use_parent_material = false
			activeClick = 0
			soldiers_held += 1
			$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
			if World.from_building != Vector2(0,0) && World.to_building == Vector2(0,0):
				World.from_building = Vector2(0,0)
				print("World.from: " + str(World.from_building))
			
		elif activeClick == 0:
			$FortressSprite.use_parent_material = true
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
				$FortressSprite.use_parent_material = false
				World.to_building = buildingPos
				activeClick = 0
				destinationClick = 1
				#else:
				#	$FortressSprite.use_parent_material = false
				#	activeClick = 0
				#	$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
				#	World.from_building = Vector2(0,0)
				#	World.to_building = Vector2(0,0)
	pass # Replace with function body.


func _on_Fortress_body_entered(body):
	if body.is_in_group("soldier") && destinationClick == 1:
		print("Soldier successfully got!")
		soldiers_held += 1
		destinationClick = 0
		$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		body.queue_free()
	pass # Replace with function body.
