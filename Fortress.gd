extends Node2D

export(PackedScene) var Soldier

func _ready():
	pass # Replace with function body.

func get_towerpos(buildingPos): #Rename this function if it's gonna be the clicking mechanic, unless tamad tayo lmao
	print("Tower position: " + String(buildingPos)) #Debug for looking positions
	var soldier = Soldier.instance()
	soldier.position = position
	add_child(soldier)
	soldier.position = Vector2(0,0)
	var v = Vector2(buildingPos - position).normalized() * 1000 #Code was only based from the bullets code we had last time, we can probably modify this better.
	soldier.linear_velocity = v
	soldier.rotation = atan2(v.y,v.x)
	pass

func create_soldier(): #Supposedly spawn the soldiers but somehow i found another way instead
	pass

func _on_ShootTimer_timeout(): #I guess we could use this if we're not gonna let the fortress shoot an infinite and fast amount of soldiers
	pass # Replace with function body.
