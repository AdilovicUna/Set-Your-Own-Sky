extends Spatial

var beers = []
var OFFSET = 50
var INITIAL_OFFSET = 150
var pos = [-5, 0, 5]
var next_beer_xPos = INITIAL_OFFSET

var rand = RandomNumberGenerator.new()

onready var player = get_node_or_null("../../Player")

func generate_beer():
	var pos_index = rand.randi_range(0, pos.size() - 1)
	var beer_index = rand.randi_range(0, beers.size() - 1)
		
	var beer = beers[beer_index].instance()
	
	next_beer_xPos += OFFSET
	beer.translation.x += next_beer_xPos
	beer.translation.z = pos[pos_index]
	add_child(beer)
	
func _physics_process(_delta):
	generate_beer()	
