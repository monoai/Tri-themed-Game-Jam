extends Node2D

export(PackedScene) var Soldier

export(Texture) var ZoomOut
export(Texture) var Bloody
export(Texture) var Bloodier

var max_tower = [4,6,8]
var max_village = [2,3,4]
var wave = Resources.current_wave

var tower_amount = max_tower[wave]
var village_amount = max_village[wave]

var from_building = Vector2(0,0)
var to_building = Vector2(0,0)

func _ready():
	#Utils.buildingList.append(get_node("Fortress"))
	Resources.wood_upgrade = 1
	Resources.steel_upgrade = 1
	Resources.soldier_speedup = 1
	Resources.soldier_produce = 0
	Resources.click_upgrade = 0
	
	Resources.enemy_spawned = 0
	Resources.enemy_limit = 20
	Resources.kill_count = 0
	pass

func _process(_delta):
	$GUI/ResourcePanel/VBoxContainer/WoodResource/WoodCounter.set_text("Wood: " + str(Resources.wood))
	$GUI/ResourcePanel/VBoxContainer/SteelResource/SteelCounter.set_text("Steel: " + str(Resources.steel))
	$GUI/ResourcePanel/VBoxContainer/FoodResource/FoodCounter.set_text("Food: " + str(Resources.food))
	$GUI/ResourcePanel/VBoxContainer/SoldierResource/TotalSoldier.set_text("Soldiers: " + str($Fortress.soldiers_held))
	$GUI/ResourcePanel/VBoxContainer/KillResource/KillCounter.set_text("Kills: " + str(Resources.kill_count))
	
	if Resources.enemy_spawned >= Resources.enemy_limit:
		$EnemyDirector/Timers/SpawnTimer.stop()
		$EnemyDirector/Timers/GraceTimer.start()
		Resources.enemy_spawned = 0
		Resources.horde_done += 1
		Resources.enemy_limit = Resources.enemy_limit + ((0.1 * Resources.horde_done) * Resources.enemy_limit)
	
	if wave >= 1:
		$Fortress/BuildingSprite.set_texture(ZoomOut)
	
	if wave == 2:
		$GUI/UpgradePanel/ScrollContainer/VBoxContainer/WorldUpgrades.hide()
	
	if Resources.kill_count < 30:
		pass
	elif Resources.kill_count < 60:
		$Background.set_texture(Bloody)
	else:
		$Background.set_texture(Bloodier)
	pass

func pass_pos(source):
	#$WorldSuccess.set_text("Success from: " + str(from_building) + " to: " +  str(to_building))
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
		var formula = 1 + (0.25 * Resources.soldier_produce)
		$Fortress.soldiers_held += formula
		Resources.food -= 20
	pass # Replace with function body.
