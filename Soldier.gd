extends RigidBody2D

class_name soldier_class

const SPEED = 200

var destination
var res_held = 0

func _ready():
	for i in get_tree().get_nodes_in_group("tower"):
		i.connect("res_pass", self, "resource_pass")
	pass

func move(fromPos, toPos):
	position = fromPos
	add_to_group("soldier")
	var direction = (toPos - fromPos).normalized()
	var motion = direction * SPEED
	linear_velocity += motion

func resource_pass(resource):
	print("resource passed")
	if resource > 0:
		res_held = resource
		print("Soldier_res: " + str(res_held))
	pass
