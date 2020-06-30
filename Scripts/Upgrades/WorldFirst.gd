extends HBoxContainer

var steelRequirement = 1000
var woodRequirement = 1000

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		if Resources.current_wave <= 2:
			Resources.current_wave += 1
		#var next_level_resource = load("res://World2.tscn")
		#var next_level = next_level_resource.instance()
		#get_parent().get_node("/root/World").free()
		Utils.buildingList.clear()
		if Resources.current_wave == 0:
			get_tree().change_scene("res://World2.tscn")
		elif Resources.current_wave == 1:
			get_tree().change_scene("res://World3.tscn")
		elif Resources.current_wave == 2:
			get_tree().change_scene("res://World3.tscn")
		else:
			print("Nope")
		#get_tree().set_current_scene(next_level)
	else:
		print("Failed successfully")
	pass # Replace with function body.
