extends Spatial

#const OFFSET = 50

var obstacles = []
var pos = [-5, 0, 5]
#var next_obstacle_x_pos = 50

var rand = RandomNumberGenerator.new()

func generate_obstacle(x):
    var type_id = rand.randi_range(0, obstacles.size() - 1)
    var pos_id = rand.randi_range(0, pos.size() - 1)
    
    var obstacle = obstacles[type_id].instance()
    
    if type_id == 2 and pos_id == 2:
         pos_id -= 1
    
    #next_obstacle_x_pos += OFFSET
    obstacle.translation.x += x
    obstacle.translation.z = pos[pos_id]
    add_child(obstacle)
    
    
    
    
    
