extends Spatial

const POS = [-5, 0, 5]

var beers = []

onready var player = get_node_or_null("../../Player")
onready var scores = get_node_or_null("../../UI/Toolbar/Scores")
onready var main = get_node_or_null("../../")

var rand = RandomNumberGenerator.new()

func _physics_process(_delta):
    if main.ended:
        return
    if main.started:
        collision_check()

func generate_beer(x):
    var pos_index = rand.randi_range(0, POS.size() - 1)
    var beer_index = rand.randi_range(0, beers.size() - 1)
    
    var i = rand.randf_range(0,1)
    if i > 0.7:
        beer_index = 4
        
    var beer = beers[beer_index].instance()
    
    beer.translation.x += x
    beer.translation.z = POS[pos_index]
    add_child(beer)

func collision_check():
    for index in player.get_slide_count():
        var collision = player.get_slide_collision(index)
        if "Beer" in collision.collider.name or "Water" in collision.collider.name:
            scores.change_score(collision.collider.name)
            collision.collider.queue_free()
            player.get_child(2).play()
            return
