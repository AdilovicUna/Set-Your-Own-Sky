extends KinematicBody

onready var ground = get_node_or_null("../Ground")
const SPEED = 15.0

func _physics_process(delta):
    var velocity = Vector3.RIGHT * SPEED
    move_and_slide(velocity)
    ground.update_pos(translation.x)
    
