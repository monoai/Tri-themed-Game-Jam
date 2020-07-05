extends KinematicBody2D

class_name enemy_class

var health = 10
var SPEED = 200

var loop_ctr = 0
var destination
var attacking = null
var movement = Vector2.ZERO
export var newPos = Vector2()

signal hit(new_hp)

func _ready():
	self.connect("hit", get_node("Life"), "update_health")
	pass

func _process(delta):
	position += movement * delta
	if health <= 0:
		Resources.kill_count += 1
		print("Enemy dead")
		self.queue_free()
	pass

func click_reduce():
	var formula = 1 + (0.50 * Resources.click_upgrade)
	health -= formula
	print("Enemy clicked")
	emit_signal("hit", health)

func health_reduced(new_hp):
	emit_signal("hit", new_hp)

func move(fromPos, toPos):
	position = fromPos
	add_to_group("enemy")
	var distance = (toPos - fromPos).length()
	if distance > 1500:
#		$AnimatedSprite.play("walk")
#		print("Distance over 900")
#		newPos = Utils.buildingList[randi()%6].position
#		toPos = newPos
#		move(fromPos, toPos)
		return 0
	else:
		var direction = (toPos - fromPos).normalized()
		var motion = direction * SPEED
		movement = motion
		return 1

func attack():
	movement = Vector2.ZERO
	$AnimatedSprite.play("attack")

func change_target():
	$AnimatedSprite.play("walk")
	if Resources.current_wave == 0:
		return Utils.buildingList[randi()%6].position
	elif Resources.current_wave == 1:
		return Utils.buildingList[randi()%9].position
	elif Resources.current_wave == 2:
		return Utils.buildingList[randi()%12].position
