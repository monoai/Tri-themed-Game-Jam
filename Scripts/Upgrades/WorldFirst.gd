extends HBoxContainer

var steelRequirement = 100
var woodRequirement = 100

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.current_wave += 1
		#var next_level_resource = load("res://World2.tscn")
		#var next_level = next_level_resource.instance()
		#get_parent().get_node("/root/World").free()
		Utils.buildingList.clear()
		get_tree().change_scene("res://World2.tscn")
		#get_tree().set_current_scene(next_level)
	else:
		print("Failed successfully")
	pass # Replace with function body.
