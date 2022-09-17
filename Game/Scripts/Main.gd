extends Node

onready var beers = get_node("Environment/Beers")

func _ready():
	for name in ["Beer_Kozel", "Beer_Krus_dark", "Beer_Krus_light", 
	"Beer_Staropramen"]:
		beers.beers.append(load("res://Scenes/Beers/" + name + ".tscn"))
