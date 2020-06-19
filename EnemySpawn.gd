extends Node2D

export(PackedScene) var Enemy
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.move(Vector2.ZERO, Utils.fortress_pos - position)
	
