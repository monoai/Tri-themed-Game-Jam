extends Node2D

export(PackedScene) onready var Tower
export(PackedScene) onready var Village

onready var World = get_node("/root/World/")

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
		Utils.buildingList.append(tower)
		self.queue_free()

	elif ZaWarudo == 2 && World.village_amount > 0:
		var village = Village.instance()
		World.call_deferred("add_child", village, true)
		village.position = self.position
		#print("Spawn_Village Position: " + String(village.position))
		World.village_amount -= 1
		Utils.buildingList.append(village)
		self.queue_free()
	
	elif World.tower_amount == 0 and World.village_amount == 0: #Checks if the buildings already reached 0 then deletes it, otherwise we'll generate infinite amounts of buildings and get a Stack Overflow error
		self.queue_free()

	else: 
		#I honestly tried a lot of ways to make it loop, somehow a while loop checking whether or not the buildings has reached > 0 won't work whatever I did, i tried it for an hour and idk if I was just too sleepy or I really need to rewrite the entire code.
		#What I just did is to make this entire fucking thing do a recursion instead, it works perfectly and I'm not gonna fucking keep working on it overnight since I have to wake up at 9 AM. Goddamn man it's 2 lines of code.
		#print("DID NOT SPAWN")
		createBuilding()
	pass
