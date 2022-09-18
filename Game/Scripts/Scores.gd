extends Control

var krus_light_score = 0
var krus_dark_score = 0
var kozel_score = 0
var staropramen_score = 0

var krus_light_goal = 0
var krus_dark_goal = 0
var kozel_goal = 0
var staropramen_goal = 0

func increment_score(type):
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
