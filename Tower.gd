extends Area2D

signal towerPosition(buildingPos)

var soldiers_held = 0

func _ready():
	add_to_group("tower") #Groups thing that I'm testing out
	connect("towerPosition", get_node("/root/World/Fortress"), "get_towerpos") #Connects the signal to the function in Fortress
	$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
	pass # Replace with function body.

func _on_Tower_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		var buildingPos = self.position
		emit_signal("towerPosition", buildingPos)
	pass # Replace with function body.

func _on_Tower_body_entered(body):
	if body.is_in_group("soldier"):
		print("Soldier successfully got!")
		soldiers_held += 1
		$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		body.queue_free()
	pass # Replace with function body.
