extends CanvasLayer

func _ready():
	pass

func info_panel(buildname, soldiers_held, temp_steel, temp_wood):
	$InfoPanel/GridContainer/BuildingName.set_text(buildname)
	$InfoPanel/GridContainer/BuildingSoldier.set_text("Soldiers: " + str(soldiers_held))
	$InfoPanel/GridContainer/BuildingSteel.set_text("Steel: " + str(temp_steel))
	$InfoPanel/GridContainer/BuildingWood.set_text("Wood: " + str(temp_wood))
	pass
