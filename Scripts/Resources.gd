extends Node

onready var World = get_node("/root/World")

var current_wave = 0
var total_soldier = 10
var wood = 40
var steel = 20
var food = 0

var wood_upgrade = 1
var steel_upgrade = 1
var soldier_speedup = 1
var soldier_produce = 0
var click_upgrade = 0

var buildings_list = []

func _ready():
	pass
