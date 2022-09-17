extends Control

var staropramen_score = 0
var krus_light_score = 0
var krus_dark_score = 0
var kozel_score = 0

func increment_score(type):
    match(type):
        "staropramen":
            print("staropramen")
        "krus_dark":
            print("dark")
        "krus_light":
            print("light")
        "kozel":
            print("kozel")
