extends Node

var Tilemap setget set_tile_map
var Characters

var obstacles_map

func _ready():
	pass

func set_tile_map(value):
	obstacles_map = value.get_used_cells()
	Tilemap = value
	pass
