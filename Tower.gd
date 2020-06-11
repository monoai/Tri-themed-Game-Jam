extends Area2D

signal towerPosition(towerPos)

func _ready():
	add_to_group("tower")
	connect("towerPosition", get_node("/root/World/Fortress"), "get_towerpos")
	pass # Replace with function body.

func _on_Tower_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("left_click"):
		var towerPos = self.position
		emit_signal("towerPosition", towerPos)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
