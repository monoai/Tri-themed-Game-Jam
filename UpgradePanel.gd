extends Panel

func _ready():
	pass

func _on_FirstUpgrade_pressed():
	if Resources.steel >= 20 and Resources.wood >= 40:
		print("Success")
	else:
		print("Failed successfully")
	pass # Replace with function body.
