extends PanelContainer

func _ready():
	var enemy_max_health = get_parent().health
	$VBoxContainer/HBoxContainer/bar.max_value = enemy_max_health
	pass

func update_health(new_hp):
	$VBoxContainer/HBoxContainer/hp_label.text = str(new_hp)
	$VBoxContainer/HBoxContainer/bar.value = new_hp
	pass
