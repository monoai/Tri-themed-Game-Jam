extends CanvasLayer

func _ready():
	pass

func _process(_delta):
	if Utils.selected:
		info_panel(Utils.selected.get_node("BuildingSprite").get_texture(), Utils.selected.buildname, Utils.selected.soldiers_held, Utils.selected.temp_steel, Utils.selected.temp_wood)
	else:
		info_panel(null, "None", 0, 0, 0)

func info_panel(buildsprite, buildname, soldiers_held, temp_steel, temp_wood):
	$InfoPanel/GridContainer/BuildingIcon.set_texture(buildsprite)
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

func _on_Upgrades_toggled(button_pressed):
	if button_pressed:
		$UpgradePanel.show()
	else:
		$UpgradePanel.hide()
	pass # Replace with function body.


func _on_Button_pressed():
	Resources.wood += 100
	Resources.steel += 100
	Resources.food += 100
	Resources.kill_count += 10
	pass # Replace with function body.
