extends HBoxContainer

var geometric = 1
var upgradeAmount = 2

var steelRequirement = 35
var woodRequirement = 50

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		Resources.steel_upgrade += 1
		upgradeAmount += 1
		geometric += 1
		steelRequirement = steelRequirement * geometric
		woodRequirement = woodRequirement * geometric
		$Label.set_text("Adds x%d to Steel Production. " %upgradeAmount + str("(%d Steel, ") %steelRequirement + str("%d Wood)") %woodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
