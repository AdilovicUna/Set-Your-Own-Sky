extends KinematicBody

onready var ground = get_node_or_null("../Environment/Ground")
const SPEED = 15.0

<<<<<<< HEAD
func _physics_process(_delta):
    var velocity = Vector3.RIGHT * SPEED
    var _return = move_and_slide(velocity)
    ground.update_pos(translation.x)
    
=======
func _physics_process(delta):
	var velocity = Vector3.RIGHT * SPEED
	move_and_slide(velocity)
	ground.update_pos(translation.x)
	
>>>>>>> 94bf98fe0e58c8beec43143911edd518eaedeb5b
