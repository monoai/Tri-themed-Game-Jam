extends Node2D

export(PackedScene) onready var Tower
export(PackedScene) onready var Village

onready var World = get_node("/root/World/")
onready var wave = World.wave

var rng = RandomNumberGenerator.new()

func _ready():
	createBuilding()
	pass
	
func createBuilding():
	rng.randomize()
	var ZaWarudo = rng.randi_range(1,2)
	#print("ZA WARUDO: " + String(ZaWarudo))
	#print("Tower Amount:" + String(World.tower_amount))
	#print("Village Amount:" + String(World.village_amount))
	if ZaWarudo == 1 && World.tower_amount > 0:
		var tower = Tower.instance()
		World.call_deferred("add_child", tower, true)
		tower.position = self.position
		#print("Spawn_Tower Position: " + String(tower.position))
		World.tower_amount -= 1
		self.queue_free()

	elif ZaWarudo == 2 && World.village_amount > 0:
		var village = Village.instance()
		World.call_deferred("add_child", village, true)
		village.position = self.position
		#print("Spawn_Village Position: " + String(village.position))
		World.village_amount -= 1
		self.queue_free()

	else:
		#print("DID NOT SPAWN")
		createBuilding()
	pass
