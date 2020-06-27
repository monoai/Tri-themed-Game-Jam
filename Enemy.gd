extends RigidBody2D

class_name enemy_class

const SPEED = 200

var loop_ctr = 0
var destination
var attacking = null
export var newPos = Vector2()

func _ready():
	pass

func move(fromPos, toPos):
	position = fromPos
	add_to_group("enemy")
	var distance = (toPos - fromPos).length()
	if distance > 900:
#		$AnimatedSprite.play("walk")
#		print("Distance over 900")
#		newPos = Utils.buildingList[randi()%6].position
#		toPos = newPos
#		move(fromPos, toPos)
		pass
	else:
		var direction = (toPos - fromPos).normalized()
		var motion = direction * SPEED
		linear_velocity += motion

func attack():
	linear_velocity = Vector2.ZERO
	$AnimatedSprite.play("attack")

func change_target():
	$AnimatedSprite.play("walk")
	return Utils.buildingList[randi()%6].position

func _on_AnimatedSprite_animation_finished():
	loop_ctr += 1
	if loop_ctr == 3:
		#attack the building
		print("building attacked")
		loop_ctr = 0
		if attacking and attacking.soldiers_held > 0:
			attacking.soldiers_held -= 1
		else:
			move(position, change_target())
	$AnimatedSprite.play("attack")
