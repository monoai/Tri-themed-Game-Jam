extends HBoxContainer

var geometric = 1
var upgradeAmount = 2

var steelRequirement = 20
var woodRequirement = 40

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		Resources.wood_upgrade += 1
		upgradeAmount += 1
		geometric += 1
		steelRequirement = 20 * geometric
		woodRequirement = 40 * geometric
		$Label.set_text("Adds x%d to Wood Production. " %upgradeAmount + str("%d Steel ") %steelRequirement + str("and %d Wood needed.") %woodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
