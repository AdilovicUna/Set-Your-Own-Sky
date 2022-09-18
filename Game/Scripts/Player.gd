extends KinematicBody

onready var ground = get_node_or_null("../Environment/Ground")
onready var animation = get_node_or_null("Dev/Animation")

const SPEED = 15.0
const TURNING_SPEED = 0.5
const LEFT_LIMIT = -5.5
const RIGHT_LIMIT = 5.5
const JUMP_LIMIT = 6
const GRAVITY = -10

var increase = false

func _physics_process(_delta):
    var velocity = Vector3.RIGHT * SPEED
    var _return = move_and_slide(velocity)
    ground.update_pos(translation.x)
    
    if Input.is_action_pressed("right") and translation.z < RIGHT_LIMIT:
        translate_object_local(Vector3.BACK * TURNING_SPEED)
    elif Input.is_action_pressed("left") and LEFT_LIMIT < translation.z:
        translate_object_local(Vector3.FORWARD * TURNING_SPEED)
    elif Input.is_action_just_pressed("jump") and translation.y <= 0:
        animation.stop()
        increase = true
    
    if increase and translation.y < JUMP_LIMIT:
        translate_object_local(Vector3.UP * 0.8)                  
    elif translation.y >= JUMP_LIMIT:
        increase = false
        animation.play()
        
    if not increase and translation.y > 0:
        translation.y += GRAVITY * _delta
        
