extends Spatial

var obstacles = []
var pos = [-5, 0, 5]
var wall_pos = [-3, 3]

onready var player = get_node_or_null("../../Player")
onready var main = get_node_or_null("../../")

var rand = RandomNumberGenerator.new()

func _ready():
    rand.randomize()

func _physics_process(_delta):
    if main.ended:
        return
        
    if main.started:
        check_collision()
    
func check_collision():
    for index in player.get_slide_count():
        var collision = player.get_slide_collision(index)
        var name = collision.collider.name
        if "Road" in name or "Wall" in name or "Cone" in name:
            main.game_over(false)
        
            
func generate_obstacle(x):
    var type_id = rand.randi_range(0, obstacles.size() - 1)
    var pos_id = rand.randi_range(0, pos.size() - 1)
    var obstacle = obstacles[type_id].instance()
    
    obstacle.translation.x += x
    
    if type_id == 2:
        if pos_id == 2:
            pos_id -= 1
        obstacle.translation.z = wall_pos[pos_id]
    else:
        obstacle.translation.z = pos[pos_id]
   
    add_child(obstacle)
    
    
    
    
    
