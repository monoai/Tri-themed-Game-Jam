extends KinematicBody2D

class_name enemy_class

var health = 10 setget health_reduced

const SPEED = 200

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
		print("Should be fucking dead")
		self.queue_free()
	pass

func _on_Enemy_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"): 
		var formula = 1 + (0.50 * Resources.click_upgrade)
		health -= formula
		print("Get bonked")
		emit_signal("hit", health)
	pass # Replace with function body.

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
			var ctr = 0 #failsafe if targetting cannot find a nearby building
			while move(position, change_target()) == 0 and ctr < 10:
				ctr += 1
	$AnimatedSprite.play("attack")


func _on_Hitbox_body_entered(body):
	if body is arrow:
		health -= body.damage
		emit_signal("hit", health)
		body.queue_free()
