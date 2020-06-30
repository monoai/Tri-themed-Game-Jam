extends HBoxContainer

var geometric = 1
var upgradeAmount = 2

var foodRequirement = 50

func _ready():
	pass

func _on_Button_pressed():
	if Resources.food >= foodRequirement:
		print("Success")
		Resources.food -= foodRequirement
		Resources.soldier_speedup += 1
		upgradeAmount += 1
		geometric += 1
		foodRequirement = 50 * geometric
		$Label.set_text("Makes Soldiers x%d Faster! " %upgradeAmount + str("(%d Food) ") %foodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
