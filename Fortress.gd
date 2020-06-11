extends Node2D

export(PackedScene) var Soldier

var v

func _ready():
	pass # Replace with function body.

func get_towerpos(towerPos): #Rename this function if it's gonna be the clicking mechanic
	print("Tower position:" + String(towerPos))
	var soldier = Soldier.instance()
	soldier.position = position
	add_child(soldier)
	soldier.position = Vector2(0,0)
	v = Vector2(towerPos - position).normalized() * 1000
	soldier.linear_velocity = v
	soldier.rotation = atan2(v.y,v.x)

func create_soldier(): #Supposedly spawn the soldiers but somehow i found another way instead
	pass

func _on_ShootTimer_timeout():
	pass # Replace with function body.
