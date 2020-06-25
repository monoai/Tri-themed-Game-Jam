extends Node2D

var active_spawn
var target_building

func _ready():
	pass # Replace with function body.

func select_target():
	target_building = Utils.buildingList[randi()%6]
	active_spawn = $Spawners.get_child(randi()%3)

func _on_SpawnTimer_timeout():
	select_target()
	print(len(Utils.buildingList))
	active_spawn.send(target_building.position)
	$Timers/SpawnTimer.start()


func _on_WaveTimer_timeout():
	$Timers/SpawnTimer.start()
	pass # Replace with function body.
