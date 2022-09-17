extends Spatial

var scene = preload("res://Scenes/Tree.tscn")
var rand = RandomNumberGenerator.new()

onready var player = get_node_or_null("../../Player")

func _ready():
	#rand.randomize()
	#var num_trees = rand.randi_range(30, 50)
	var trees = 10
	
	for n_tree in trees:
		# road size width and lendth is 9 and 100 and position (0,0.1,0)
		var x = rand.randi_range(0, 100)
		
		var y = randi.range()
func _process(delta):
	pass

func add_tree():
	var tree = scene.instance()

	add_child(tree)
