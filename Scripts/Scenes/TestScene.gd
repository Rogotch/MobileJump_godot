extends Node2D

export (NodePath) var _tilemap
onready var _tile_map = get_node(_tilemap)

# Called when the node enters the scene tree for the first time.
func _ready():
	MoveSystem.Tilemap = _tile_map
	print(_tile_map.get_used_cells())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
