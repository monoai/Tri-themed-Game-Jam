extends Node2D

export(PackedScene) var SlowEnemy
export(PackedScene) var NormalEnemy
export(PackedScene) var FastEnemy
export(PackedScene) var MiniBoss
export(PackedScene) var Boss

onready var World = get_node("/root/World")

var rng = RandomNumberGenerator.new()

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
	rng.randomize()
	var enemy
	var probability = rng.randf_range(0,100)
	print(probability)
	if Resources.current_wave == 0:
		if probability < 17.5:
			enemy = FastEnemy.instance()
			print("Fast Summoned")
		elif probability < 25:
			enemy = SlowEnemy.instance()
			print("Slow Summoned")
		else:
			enemy = NormalEnemy.instance()
			print("Normal Summoned")
	
	elif Resources.current_wave == 1:
		if probability < 10:
			enemy = MiniBoss.instance()
			print("Mini Boss Summoned")
		if probability < 20:
			enemy = FastEnemy.instance()
			print("Fast Summoned")
		elif probability < 25:
			enemy = SlowEnemy.instance()
			print("Slow Summoned")
		else:
			enemy = NormalEnemy.instance()
			print("Normal Summoned")
	
	elif Resources.current_wave == 2:
		if probability < 15.5:
			enemy = FastEnemy.instance()
			print("Fast Summoned")
		elif probability < 15:
			enemy = SlowEnemy.instance()
			print("Slow Summoned")
		elif probability < 20:
			enemy = NormalEnemy.instance()
			print("Normal Summoned")
		elif probability < 20.5:
			enemy = MiniBoss.instance()
			print("Mini Boss Summoned")
		else:
			enemy = Boss.instance()
			print("Boss Summoned")
	Resources.enemy_spawned += 1
	get_parent().get_parent().get_parent().add_child(enemy)
	enemy.move(position, target)
