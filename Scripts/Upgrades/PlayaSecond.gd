extends HBoxContainer

var geometric = 1

var steelRequirement = 50
var woodRequirement = 50

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		Resources.soldier_produce += 1
		geometric += 1
		steelRequirement = steelRequirement * geometric
		woodRequirement = woodRequirement * geometric
		$Label.set_text("Make more Soldiers! Adds a 0.25 increase to \nSoldier production. " + str("(%d Steel, ") %steelRequirement + str("%d Wood)") %woodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
