extends Spatial

const OFFSET = 50
const POS = [-5, 0, 5]

var beers = []
var next_beer_xPos = 100

var rand = RandomNumberGenerator.new()

onready var player = get_node_or_null("../../Player")

func generate_beer():
    var pos_index = rand.randi_range(0, POS.size() - 1)
    var beer_index = rand.randi_range(0, beers.size() - 1)
        
    var beer = beers[beer_index].instance()
    
    next_beer_xPos += OFFSET
    beer.translation.x += next_beer_xPos
    beer.translation.z = POS[pos_index]
    add_child(beer)
    
func _physics_process(_delta):
    generate_beer()	
