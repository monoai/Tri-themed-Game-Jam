extends Node2D

export(PackedScene) var Soldier

var max_tower = [4,5]
var max_village = [2,6]
var max_enemy = [15]
var wave = 0

var tower_amount = max_tower[wave]
var village_amount = max_village[wave]
var enemy_amount = max_enemy[wave]

var from_building = Vector2(0,0)
var to_building = Vector2(0,0)

const SPEED = 200

func _ready():
	Resources.get_max_soldiers()
	pass

func _process(_delta):
	$WorldFrom.set_text("From: " + str(from_building))
	$WorldTo.set_text("To: " + str(to_building))
	$WoodCounter.set_text("Wood: " + str(Resources.wood))
	$SteelCounter.set_text("Steel: " + str(Resources.steel))
	$FoodCounter.set_text("Food: " + str(Resources.food))
	$TotalSoldier.set_text("Total Soldier: " + str(Resources.total_soldier))
	pass

func pass_pos():
	$WorldSuccess.set_text("Success from: " + str(from_building) + " to: " +  str(to_building))
	soldier_move(from_building, to_building)


func soldier_move(fromPos, toPos):
	var soldier = Soldier.instance()
	soldier.destination = toPos
	add_child(soldier)
	soldier.move(fromPos, toPos)
