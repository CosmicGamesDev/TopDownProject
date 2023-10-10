extends Node2D

var borders = Rect2(1, 1, 38, 21)

@onready var tileMap = $Test

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	
	walker.queue_free()
	for location in map:
		tileMap.set_cell(0,location,0, Vector2(3,3))
	tileMap.set_cells_terrain_connect(0, tileMap.get_used_cells(0), 0, 0)

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		reload_level()
