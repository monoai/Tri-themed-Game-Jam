extends "res://Scripts/Buildings.gd"

export(PackedScene) var Sawmill
export(PackedScene) var Mine

var rng = RandomNumberGenerator.new()

signal res_pass(resource)


var sub_buildings_max = 2

var SPAWN_RAD = 200

func _ready():
	buildname = "Tower"
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	add_to_group("tower") #Groups thing that I'm testing out
	pass

func _process(_delta):
	$SteelAmount.set_text("Steel: " + str(temp_steel))

func _on_Tower_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		position_pass()

func _on_Tower_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
		temp_steel += body.steel_held
		temp_wood += body.wood_held
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
	elif body is enemy_class:
		body.attack()
		body.attacking = self
		
	pass # Replace with function body.

func _on_Tower_mouse_entered():
		pass # Replace with function body.

func _on_Tower_mouse_exited():
	pass # Replace with function body.
