extends RigidBody2D

class_name enemy_class

var health = 10 setget health_reduced

const SPEED = 200

var loop_ctr = 0
var destination
var attacking = null
export var newPos = Vector2()

signal hit(new_hp)

func _ready():
	connect("hit", get_node("Life"), "update_health")
	pass

func _process(_delta):
	if health <= 0:
		print("Should be fucking dead")
		self.queue_free()
	pass

func _on_Enemy_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		health -= 1
		print("Get bonked")
		emit_signal("hit", health)
	pass # Replace with function body.

func health_reduced(new_hp):
	emit_signal("hit", new_hp)

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
