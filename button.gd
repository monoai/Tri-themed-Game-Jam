extends HBoxContainer

var geometric = 1

var steelRequirement = 10
var woodRequirement = 10
var foodRequirement = 10

func _ready():
	pass

func _on_Button_pressed():
	if Resources.steel >= steelRequirement and Resources.wood >= woodRequirement and Resources.food >= foodRequirement:
		print("Success")
		Resources.steel -= steelRequirement
		Resources.wood -= woodRequirement
		Resources.food -= foodRequirement
		Resources.click_upgrade += 1
		geometric += 1
		steelRequirement = steelRequirement * geometric
		woodRequirement = woodRequirement * geometric
		foodRequirement = foodRequirement * geometric
		$Label.set_text("Adds 0.5 ATK DMG to your Clicks.\n" + str("(%d Steel, ") %steelRequirement + str("%d Wood, ") %woodRequirement + str("%d Food)") %foodRequirement)
	else:
		print("Failed successfully")
	pass # Replace with function body.
