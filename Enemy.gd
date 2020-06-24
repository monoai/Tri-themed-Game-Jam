extends RigidBody2D

class_name enemy_class

const SPEED = 200

var loop_ctr = 0
var destination

func _ready():
	pass

func move(fromPos, toPos):
	position = fromPos
	add_to_group("enemy")
	var direction = (toPos - fromPos).normalized()
	var motion = direction * SPEED
	linear_velocity += motion

func attack():
	linear_velocity = Vector2.ZERO
	$AnimatedSprite.play("attack")

func _on_AnimatedSprite_animation_finished():
	loop_ctr += 1
	if loop_ctr == 3:
		#attack the building
		print("building attacked")
		loop_ctr = 0
	$AnimatedSprite.play("attack")
