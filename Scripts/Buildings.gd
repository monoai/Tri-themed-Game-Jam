extends Area2D

onready var World = get_node("/root/World/")

var soldiers_held = 0
var temp_steel = 0
var temp_wood = 0
var destroyed = false
var buildname

func _ready():
	Resources.buildings_list.append(self)
	
func _process(_delta):
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		
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
			World.pass_pos(Utils.selected)
