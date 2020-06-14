extends Node2D

export(PackedScene) var Soldier

const SPEED = 50

func _ready():
	$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
	pass # Replace with function body.

func get_towerpos(buildingPos): #Rename this function if it's gonna be the clicking mechanic, unless tamad tayo lmao
	if Resources.max_soldier > 0:
		print("Tower position: " + String(buildingPos)) #Debug for looking positions
		var soldier = Soldier.instance()
		soldier.position = position
		add_child(soldier)
		soldier.add_to_group("soldier")
		soldier.position = Vector2(0,0)
		var direction = (buildingPos - position).normalized() #Code was only based from the bullets code we had last time, we can probably modify this better.
		var motion = direction * SPEED
		soldier.linear_velocity += motion
		soldier.rotation = atan2(direction.y,direction.x)
		Resources.max_soldier -= 1
		$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
		pass
	else:
		#We should probably insert some animation or something
		pass

func create_soldier(): #Supposedly spawn the soldiers but somehow i found another way instead
	pass

func _on_ShootTimer_timeout(): #I guess we could use this if we're not gonna let the fortress shoot an infinite and fast amount of soldiers
	pass # Replace with function body.
