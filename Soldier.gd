extends RigidBody2D

class_name soldier_class

var destination
var steel_held = 0
var wood_held = 0

var SPEED = 100

func _ready():
	pass

func move(fromPos, toPos):
	var formula = SPEED * Resources.soldier_speedup
	#print("Soldier formula: " + str(formula))
	position = fromPos
	add_to_group("soldier")
	var direction = (toPos - fromPos).normalized()
	var motion = direction * formula
	linear_velocity += motion
