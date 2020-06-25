extends RigidBody2D

class_name soldier_class

const SPEED = 200

var destination
var steel_held = 0
var wood_held = 0

func _ready():
	pass

func move(fromPos, toPos):
	position = fromPos
	add_to_group("soldier")
	var direction = (toPos - fromPos).normalized()
	var motion = direction * SPEED
	linear_velocity += motion
