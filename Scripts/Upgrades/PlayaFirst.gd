extends HBoxContainer

var geometric = 1
var upgradeAmount = 2

var steelRequirement = 100
var woodRequirement = 100

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		Resources.soldier_speedup += 1
		upgradeAmount += 1
		geometric += 1
		steelRequirement = 100 * geometric
		woodRequirement = 100 * geometric
		$Label.set_text("Makes Soldiers x%d Faster! " %upgradeAmount + str("%d Steel ") %steelRequirement + str("and %d Wood needed.") %woodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
