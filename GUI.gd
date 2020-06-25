extends CanvasLayer

func _ready():
	pass

func _process(_delta):
	if Utils.selected:
		info_panel(Utils.selected.buildname, Utils.selected.soldiers_held, Utils.selected.temp_steel, Utils.selected.temp_wood)
	else:
		info_panel("None", 0, 0, 0)

		
func info_panel(buildname, soldiers_held, temp_steel, temp_wood):
	$InfoPanel/GridContainer/BuildingName.set_text(buildname)
	$InfoPanel/GridContainer/BuildingSoldier.set_text("Soldiers: " + str(soldiers_held))
	if buildname == "Fortress":
		$InfoPanel/GridContainer/BuildingSteel.set_text("Steel: " + str(Resources.steel))
		$InfoPanel/GridContainer/BuildingWood.set_text("Wood: " + str(Resources.wood))
	elif buildname == "Village":
		$InfoPanel/GridContainer/BuildingSteel.set_text("Food: " + str(Resources.food))
		$InfoPanel/GridContainer/BuildingWood.set_text("")
	else:
		$InfoPanel/GridContainer/BuildingSteel.set_text("Steel: " + str(temp_steel))
		$InfoPanel/GridContainer/BuildingWood.set_text("Wood: " + str(temp_wood))
	pass
