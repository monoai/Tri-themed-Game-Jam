extends Area2D

export(PackedScene) var Sawmill
export(PackedScene) var Mine

onready var World = get_node("/root/World/")

var rng = RandomNumberGenerator.new()

var soldiers_held = 0
var sub_buildings_max = 2

var activeClick = 0
var destinationClick = 0

var SPAWN_RAD = 200

func _ready():
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
			soldiers_held += 1
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
		
		if sub_buildings_max > 0:
			while sub_buildings_max != 0:
				rng.randomize()
				var chance = rng.randi_range(1,2)
				var rad = rng.randf()*(SPAWN_RAD-115) + 80
				var deg = rng.randf()*360
				var radiusPos =  Vector2(rad*cos(deg),rad*sin(deg))
				
				print(chance)
				if chance == 1:
					var sawmill = Sawmill.instance()
					self.add_child(sawmill, true)
					sawmill.position = radiusPos
					print("Sawmill Spawned")
					sub_buildings_max -= 1
				elif chance == 2:
					var mine = Mine.instance()
					self.add_child(mine, true)
					mine.position = radiusPos
					print("Mine Spawned")
					sub_buildings_max -= 1
				pass
		else:
			pass
		
	pass # Replace with function body.

func _on_Tower_body_exited(body):
	if body.is_in_group("soldier"):
		print("tries to exit")
	pass # Replace with function body.

func anti_glow(): #A function purely to fuckin' remove the glow on buildings since somehow due to the way I programmed shit (making every code exclusive to itself *logically*) it doesn't remove and make the from_buildings inactive, therefore I have to call every motherfucking tower group and hard-code the inactive state.
	activeClick = 0
	$TowerSprite.use_parent_material = false
	pass
