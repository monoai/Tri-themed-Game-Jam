extends Area2D

onready var World = get_node("/root/World/")

var soldiers_held = 0
var destinationClick = 0

func _ready():
	soldiers_held = Resources.max_soldier
	$SoldierAmount.set_text("Soldiers: " + str(Resources.max_soldier))
	pass # Replace with function body.

func _process(_delta):
	pass


func _on_Fortress_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("left_click"): #Could be written better daw, but fuck it, it works.
		
		if !Utils.selected:
			$FortressSprite.use_parent_material = true
			Utils.selected = self
			World.from_building = position
			
		elif Utils.selected == self:
			$FortressSprite.use_parent_material = false
			Utils.selected = null
			World.from_building = Vector2(0,0)
			$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
			
		elif Utils.selected:
			World.to_building = position
			if Utils.selected.soldiers_held > 0:
				Utils.selected.soldiers_held -= 1
				Utils.selected.get_node("SoldierAmount").set_text("Soldiers: " + str(Utils.selected.soldiers_held))
				World.pass_pos()


func _on_Fortress_body_entered(body):
	if body is soldier_class and body.destination == position:
		print("Soldier successfully got!")
		soldiers_held += 1
		destinationClick = 0
		$SoldierAmount.set_text("Soldiers: " + str(soldiers_held))
		body.queue_free()
