extends Spatial

var scene = preload("res://Scenes/Tree.tscn")
var rand = RandomNumberGenerator.new()
var next_tree_x_pos = 0

const OFFSET = 20

onready var player = get_node_or_null("../../Player")

func _ready():
	var trees = 10
	for n_tree in trees:
		# road size width and lendth is 9 and 100 and position (0,0.1,0)
		add_tree()
		
func _physics_process(_delta):
	if player.translation.x > next_tree_x_pos - 7 * OFFSET:
		add_tree()
		
	delete_tree()

func delete_tree():
	for tree in get_children():
		if player.translation.x > tree.translation.x + OFFSET:
			tree.queue_free()

func add_tree():
	var tree_l = scene.instance()
	var tree_r = scene.instance()
	
	next_tree_x_pos += OFFSET
	
	var z_l = rand.randi_range(-OFFSET, -150)
	var z_r = rand.randi_range(OFFSET, 150)
	#var x_l = rand.randi_range(OFFSET, 50)
	#var x_r = rand.randi_range(OFFSET, 50)
	
	tree_l.translation.x += next_tree_x_pos
	tree_l.translation.z = z_l
	
	tree_r.translation.x += next_tree_x_pos
	tree_r.translation.z = z_r
	
	add_child(tree_l)
	add_child(tree_r)
	
	
