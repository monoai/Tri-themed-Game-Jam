extends RigidBody2D

func _ready():
	pass

func _on_Spir_body_entered(body):
	if body is enemy_class:
		body.health -= 1
		print("arrow bonk")
		self.queue_free()
	pass # Replace with function body.


func _on_AutoDelete_timeout():
	self.queue_free()
	pass # Replace with function body.
