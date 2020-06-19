extends Area2D

onready var World = get_node("/root/World/")

var soldiers_held = 0

func _ready():
	pass # Replace with function body.

func position_pass():
	if !Utils.selected:
		$BuildingSprite.use_parent_material = true
		Utils.selected = self
		World.from_building = position
		
	elif Utils.selected == self:
		$BuildingSprite.use_parent_material = false
		Utils.selected = null
		World.from_building = Vector2(0,0)
		$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		
	elif Utils.selected and !Utils.selected.is_in_group("non_combat"):
		World.to_building = position
		if Utils.selected.soldiers_held > 0:
			Utils.selected.soldiers_held -= 1
			Utils.selected.get_node("SoldierAmount").set_text("Soldiers: " + str(Utils.selected.soldiers_held))
			World.pass_pos()
