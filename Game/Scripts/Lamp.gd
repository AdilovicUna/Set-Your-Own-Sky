extends Spatial

var scene = preload("res://Scenes/Lamp.tscn")

onready var player = get_node_or_null("../../Player")

const DISTANCE_BETWEEN_LAMPS = 40

var next_lamp_x_pos = 0
var draw_left = true

func _ready():
	# generate biginning
	for i in range (0,5):
		add_lamp()

func _physics_process(_delta):
	if player.translation.x > next_lamp_x_pos - DISTANCE_BETWEEN_LAMPS:
		print("ADDING")
		add_lamp()
		
	delete_lamp()

func delete_lamp():
	for lamp in get_children():
		if player.translation.x > lamp.translation.x + DISTANCE_BETWEEN_LAMPS:
			print("DELETED")
			lamp.queue_free()
			
	
func add_lamp():
	var lamp = scene.instance()
	next_lamp_x_pos += DISTANCE_BETWEEN_LAMPS
	
	if draw_left:
		lamp.rotate_y(PI)
		
	draw_left = !draw_left
	
	lamp.translation.x += next_lamp_x_pos
	
	add_child(lamp)
