extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var active_spawn
var target_building

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func select_target():
	target_building = Utils.buildingList[randi()%7]
	active_spawn = $Spawners.get_child(randi()%3)

func _on_SpawnTimer_timeout():
	select_target()
	print(len(Utils.buildingList))
	active_spawn.send(target_building.position)
	$Timers/SpawnTimer.start()
