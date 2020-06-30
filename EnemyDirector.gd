extends Node2D

var active_spawn
var target_building

func _ready():
	pass # Replace with function body.

func select_target():
	if Resources.current_wave == 0:
		target_building = Utils.buildingList[randi()%6]
	elif Resources.current_wave == 1:
		target_building = Utils.buildingList[randi()%9]
	elif Resources.current_wave == 2:
		target_building = Utils.buildingList[randi()%12]
	active_spawn = $Spawners.get_child(randi()%3)

func _on_SpawnTimer_timeout():
	select_target()
	print(len(Utils.buildingList))
	active_spawn.send(target_building.position)
	$Timers/SpawnTimer.start()


func _on_WaveTimer_timeout():
	$Timers/SpawnTimer.start()
	pass # Replace with function body.


func _on_GraceTimer_timeout():
	$Timers/SpawnTimer.set_one_shot(false)
	$Timers/SpawnTimer.start()
	pass # Replace with function body.
