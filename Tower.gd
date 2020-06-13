extends Area2D

signal towerPosition(towerPos)

func _ready():
	add_to_group("tower") #Groups thing that I'm testing out, could be removed.
	connect("towerPosition", get_node("/root/World/Fortress"), "get_towerpos") #Connects the signal to the function in Fortress
	pass # Replace with function body.

func _on_Tower_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		var towerPos = self.position
		emit_signal("towerPosition", towerPos)
	pass # Replace with function body.
