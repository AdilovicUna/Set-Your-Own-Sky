extends Node

onready var beers = get_node("Environment/Beers")
onready var obstacles = get_node("Environment/Obstacles")
onready var player = get_node_or_null("Player")
onready var toolbar = get_node_or_null("UI/Toolbar")
onready var menu = get_node_or_null("UI/Menu")
onready var startMenu = get_node_or_null("UI/Menu/Start")
onready var winMenu = get_node_or_null("UI/Menu/Won")
onready var lostMenu =  get_node_or_null("UI/Menu/Lost")
onready var scores = get_node_or_null("UI/Toolbar/Scores")
onready var click = get_node_or_null("Click")

var rand = RandomNumberGenerator.new()

var beer_xPos = 100
var obs_xPos = 50
var offset = 0

var started = false

func _ready():
    click.stream.loop = false
    startMenu.show()
    
func start():
    rand.randomize()
    for name in ["Beer_Kozel", "Beer_Krus_dark", "Beer_Krus_light", 
    "Beer_Staropramen", "Water"]:
        beers.beers.append(load("res://Scenes/Beers/" + name + ".tscn"))

    for name in ["Cone", "Road_sign", "Wall"]:
        obstacles.obstacles.append(load("res://Scenes/Obstacles/" + name + ".tscn"))
    started = true
         
func _physics_process(delta):
    if started:
        generate_object()    
    
func generate_object():
    var n = rand.randf_range(0, 1)
    offset = rand.randi_range(40, 80)
    
    # 60% for walls
    if n > 0.6:
        obs_xPos += offset
        obstacles.generate_obstacle(obs_xPos)
    else:
        beer_xPos += offset
        beers.generate_beer(beer_xPos)


func game_over(win):
    toolbar.hide()
    menu.show()
    startMenu.hide()
    
    if win:
        winMenu.show()
    else:
        lostMenu.show()
        
func _on_Button_pressed():
    click.play()
    menu.hide()
    toolbar.show()
    var p1 = int(startMenu.get_child(0).get_line_edit().text)
    var p2 = int(startMenu.get_child(1).get_line_edit().text)
    var p3 = int(startMenu.get_child(2).get_line_edit().text)
    var p4 = int(startMenu.get_child(3).get_line_edit().text)
    scores.set_param(p1, p2, p3, p4)
    start()
    
func _on_End2_pressed():
    click.play()
    get_tree().quit()

func _on_End_pressed():
    click.play()
    get_tree().quit()

func _on_Restart_pressed():
    click.play()
    get_tree().reload_current_scene()


func _on_SpinBox_value_changed(value):
    click.play()


func _on_SpinBox2_value_changed(value):
    click.play()


func _on_SpinBox3_value_changed(value):
    click.play()


func _on_SpinBox4_value_changed(value):
    click.play()
