extends Node2D

export(PackedScene) var Soldier

var max_tower = [4,5]
var max_village = [2,6]
var max_enemy = [15,16]
var wave = Resources.current_wave

var tower_amount = max_tower[wave]
var village_amount = max_village[wave]
var enemy_amount = max_enemy[wave]

var from_building = Vector2(0,0)
var to_building = Vector2(0,0)

func _ready():
	#Utils.buildingList.append(get_node("Fortress"))
	pass

func _process(_delta):
	$WorldFrom.set_text("From: " + str(from_building))
	$WorldTo.set_text("To: " + str(to_building))
	$GUI/ResourcePanel/VBoxContainer/WoodResource/WoodCounter.set_text("Wood: " + str(Resources.wood))
	$GUI/ResourcePanel/VBoxContainer/SteelResource/SteelCounter.set_text("Steel: " + str(Resources.steel))
	$GUI/ResourcePanel/VBoxContainer/FoodResource/FoodCounter.set_text("Food: " + str(Resources.food))
	$GUI/ResourcePanel/VBoxContainer/SoldierResource/TotalSoldier.set_text("Total Soldier: " + str($Fortress.soldiers_held))
	pass

func pass_pos(source):
	$WorldSuccess.set_text("Success from: " + str(from_building) + " to: " +  str(to_building))
	soldier_move(from_building, to_building, source)


func soldier_move(fromPos, toPos, source):
	var soldier = Soldier.instance()
	soldier.destination = toPos
	
	if source.temp_steel >= 20:
		soldier.steel_held = 20
		source.temp_steel -= 20
		
	if source.temp_wood >= 20:
		soldier.wood_held = 20
		source.temp_wood -= 20
	
	add_child(soldier, true)
	soldier.move(fromPos, toPos)


func _on_SoldierGen_pressed():
	if Resources.food >= 20:
		$Fortress.soldiers_held += 1
		Resources.food -= 20
	pass # Replace with function body.
