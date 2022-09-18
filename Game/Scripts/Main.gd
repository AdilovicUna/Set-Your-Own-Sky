extends Node

onready var beers = get_node("Environment/Beers")
onready var obstacles = get_node("Environment/Obstacles")
onready var player = get_node_or_null("Player")
onready var scores = get_node_or_null("UI/Toolbar/Scores")

var rand = RandomNumberGenerator.new()

var beer_xPos = 100
var obs_xPos = 50
var offset = 0

func _ready():
    rand.randomize()
    for name in ["Beer_Kozel", "Beer_Krus_dark", "Beer_Krus_light", 
    "Beer_Staropramen", "Water"]:
        beers.beers.append(load("res://Scenes/Beers/" + name + ".tscn"))

    for name in ["Cone", "Road_sign", "Wall"]:
        obstacles.obstacles.append(load("res://Scenes/Obstacles/" + name + ".tscn"))
         
func _physics_process(delta):
    generate_object()    
    
func generate_object():
    var n = rand.randf_range(0, 1)
    offset = rand.randi_range(40, 80)
    
    # 60% for walls
    if n > 0.6:
        obs_xPos += offset
        obstacles.generate_obstacle(obs_xPos)
    else:
        beer_xPos += offset
        beers.generate_beer(beer_xPos)
    
