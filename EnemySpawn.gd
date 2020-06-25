extends Node2D

export(PackedScene) var Enemy

onready var World = get_node("/root/World")

func _ready():
	pass # Replace with function body.
	
func prioritize_building():
	#var y = 1
	#for i in World.max_tower[World.wave]:
	#	Resources.towers.append(get_node("/root/World/Tower" + str(y)))
	#	y += 1
	#	print(Resources.towers)

	var max_val = 999
	var actual_max
	for x in Resources.buildings_list:
		var val =  x.soldiers_held
		if max_val > val:
			max_val = val
			actual_max = x
	return actual_max

func send(target):
	var enemy = Enemy.instance()
	get_parent().get_parent().add_child(enemy)
	enemy.move(position, target)
	
	
