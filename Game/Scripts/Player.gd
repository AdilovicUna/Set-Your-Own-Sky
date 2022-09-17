extends KinematicBody

onready var ground = get_node_or_null("../Environment/Ground")
const SPEED = 15.0

func _physics_process(_delta):
    var velocity = Vector3.RIGHT * SPEED
    var _return = move_and_slide(velocity)
    ground.update_pos(translation.x)
