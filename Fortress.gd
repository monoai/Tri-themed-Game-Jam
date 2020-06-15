extends Area2D

export(PackedScene) var Soldier
export(Material) var Shader

onready var World = get_node("/root/World/")

var activeClick = 0

func _ready():
	$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
	pass # Replace with function body.

func _on_ShootTimer_timeout(): #I guess we could use this if we're not gonna let the fortress shoot an infinite and fast amount of soldiers
	pass # Replace with function body.

func _process(_delta):
	if World.pass_done == 1:
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
			if World.from_building != Vector2(0,0) && World.to_building == Vector2(0,0):
				World.from_building = Vector2(0,0)
				print("World.from: " + str(World.from_building))
			
		elif activeClick == 0:
			$FortressSprite.use_parent_material = true
			activeClick = 1
			if World.from_building == Vector2(0,0) && World.to_building == Vector2(0,0):
				World.from_building = buildingPos
				print("World.from: " + str(World.from_building))
			elif World.from_building != Vector2(0,0) && World.to_building == Vector2(0,0):
				print("World.to: " + str(World.to_building))
				$FortressSprite.use_parent_material = false
				World.to_building = buildingPos
				activeClick = 0
	pass # Replace with function body.
