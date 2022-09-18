extends Control

onready var camera_box = get_node('../../../Player/Camera/CamerBox')
onready var main = get_node('../../../')

var krus_light_score = 0
var krus_dark_score = 0
var kozel_score = 0
var staropramen_score = 0

var krus_light_goal = 0
var krus_dark_goal = 0
var kozel_goal = 0
var staropramen_goal = 0

func change_score(type):
    if "light" in type:
        krus_light_score += 1
        get_child(0).text = "%d/%d" % [krus_light_score, krus_light_goal]
    elif "dark" in type:
        krus_dark_score += 1
        get_child(1).text = "%d/%d" % [krus_dark_score, krus_dark_goal]
    elif "Kozel" in type:
        kozel_score += 1
        get_child(2).text = "%d/%d" % [kozel_score, kozel_goal]
    elif "Staropramen" in type:
        staropramen_score += 1
        get_child(3).text = "%d/%d" % [staropramen_score, staropramen_goal]
    
    if "Water" in type:
        camera_box.decrease_roughness()
    else:
        camera_box.increase_roughness()
        
    if (krus_light_score == krus_light_goal and
        krus_dark_score == krus_dark_goal and
        kozel_score == kozel_goal and
        staropramen_score == staropramen_goal):
            main.game_over(true)
    
func set_param(p1, p2, p3, p4):
    krus_light_goal = p1
    krus_dark_goal = p2
    kozel_goal = p3
    staropramen_goal = p4
    
    get_child(0).text = "%d/%d" % [krus_light_score, krus_light_goal]
    get_child(1).text = "%d/%d" % [krus_dark_score, krus_dark_goal]
    get_child(2).text = "%d/%d" % [kozel_score, kozel_goal]
    get_child(3).text = "%d/%d" % [staropramen_score, staropramen_goal]
    
