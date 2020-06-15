extends Node2D

export(PackedScene) var Soldier

signal buildPos(from_building, to_building)

var max_tower = [4,5]
var max_village = [2,6]
var wave = 0

var tower_amount = max_tower[wave]
var village_amount = max_village[wave]

var from_building = Vector2(0,0)
var to_building = Vector2(0,0) setget pass_pos
var pass_done = 0

const SPEED = 50

func _ready():
	connect("buildPos", get_node("/root/World"), "soldier_move") #Connects the signal to the function in Soldier
	pass

func _process(_delta):
	$WorldFrom.set_text("From: " + str(from_building))
	$WorldTo.set_text("To: " + str(to_building))
	pass

func pass_pos(to_building):
	print("Success from: " + str(from_building) + " to: " +  str(to_building))
	$WorldSuccess.set_text("Success from: " + str(from_building) + " to: " +  str(to_building))
	emit_signal("buildPos", from_building, to_building)
	pass_done = 1
	from_building = Vector2(0,0)
	to_building = Vector2(0,0)
	pass

func soldier_move(fromPos, toPos):
	if Resources.max_soldier > 0:
		var soldier = Soldier.instance()
		soldier.position = fromPos
		add_child(soldier)
		soldier.add_to_group("soldier")
		var direction = (toPos - fromPos).normalized() #Code was only based from the bullets code we had last time, we can probably modify this better.
		var motion = direction * SPEED
		soldier.linear_velocity += motion
		soldier.rotation = atan2(direction.y,direction.x)
		Resources.max_soldier -= 1
		#$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
		pass
	else:
		#We should probably insert some animation or something
		pass
	pass
