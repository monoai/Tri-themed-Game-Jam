extends Area2D

export(PackedScene) var Sawmill
export(PackedScene) var Mine

onready var World = get_node("/root/World/")

var rng = RandomNumberGenerator.new()

var soldiers_held = 0
var sub_buildings_max = 2

var SPAWN_RAD = 200

func _ready():
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	add_to_group("tower") #Groups thing that I'm testing out
	pass

func _process(_delta):
	pass

func _on_Tower_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		
		if !Utils.selected:
			$TowerSprite.use_parent_material = true
			Utils.selected = self
			World.from_building = position
		
		elif Utils.selected == self:
			$TowerSprite.use_parent_material = false
			Utils.selected = null
			World.from_building = Vector2(0,0)
			$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))

		elif Utils.selected:
			World.to_building = position
			if Utils.selected.soldiers_held > 0:
				Utils.selected.soldiers_held -= 1
				Utils.selected.get_node("SoldierAmount").set_text("Soldiers: " + str(Utils.selected.soldiers_held))
				World.pass_pos()


func _on_Tower_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
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

