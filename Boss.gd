extends "res://Enemy.gd"

func _ready():
	add_to_group("enemy")
	health = 50
	SPEED = 50
	pass

func _on_NormalEnemy_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		click_reduce()
	pass # Replace with function body.

func _on_AnimatedSprite_animation_finished():
	loop_ctr += 1
	if loop_ctr == 3:
		#attack the building
		#print("building attacked")
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
