extends Area2D

onready var World = get_node("/root/World/")

signal info_pass(buildname, soldierheld, temp_steel, temp_wood)

var soldiers_held = 0
var temp_steel = 0
var temp_wood = 0

func _ready():
	Resources.buildings_list.append(self)
	for x in Resources.buildings_list: #I have no idea why but putting this for-loop anywhere wouldn't work.
		x.connect("info_pass", get_parent().get_node("GUI"), "info_panel")
	pass # Replace with function body.

func position_pass():
	if !Utils.selected:
		$BuildingSprite.use_parent_material = true
		Utils.selected = self
		emit_signal("info_pass", Utils.selected.buildname, Utils.selected.soldiers_held, Utils.selected.temp_steel, Utils.selected.temp_wood)
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
