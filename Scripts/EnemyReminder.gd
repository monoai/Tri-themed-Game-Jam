extends Label

func _ready():
	pass

func _process(_delta):
	if get_parent().get_node("EnemyDirector/Timers/WaveTimer").time_left <= 0:
		self.hide()
	else:
		self.set_text("Enemies will spawn in: " + str(get_parent().get_node("EnemyDirector/Timers/WaveTimer").time_left) + str("seconds"))
