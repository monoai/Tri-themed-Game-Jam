extends KinematicBody2D

class_name arrow
var target
var motion
var damage
 
func _ready():
	pass

func _process(delta):
	position += motion*delta


func _on_AutoDelete_timeout():
	self.queue_free()
	pass # Replace with function body.
