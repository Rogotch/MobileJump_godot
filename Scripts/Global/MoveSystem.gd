extends Node

enum {CALM, FIGHT}

var Tilemap setget set_tile_map
var Obstacles setget set_obstacles_map
var tile_offset
var Characters

var scene_condition = CALM

var obstacles_map
var floor_map

func _ready():
	pass

func set_tile_map(value):
	floor_map = value.get_used_cells()
	Tilemap = value
	tile_offset = Tilemap.cell_size/2
	get_tree().call_group("Characters", "set_on_map")
	pass

func set_obstacles_map(value):
	obstacles_map = value.get_used_cells()
	Obstacles = value
	pass

func move(character : Character, direction : Vector2):
	if scene_condition == CALM:
		fall_check(character)
	if direction.abs().y > 0:
		if obstacles_map.has(character.grid_position + direction):
			pass
		else:
			character.status = Character.CLIMBED
	else:
		character.status = Character.MOVEMENT
	character.move_to(Tilemap.map_to_world(character.grid_position + direction) + tile_offset)
	character.grid_position += direction
	pass

func move_check(character, direction : Vector2) -> bool:
	return !floor_map.has(character.grid_position + direction)
	pass

func fall_check(character):
	var has_ground_flag = false
	for i in 50:
		if (obstacles_map.has(character.grid_position + Vector2(0, i + 1)) ||
				floor_map.has(character.grid_position + Vector2(0, i + 1))):
			has_ground_flag = true
			if i > 0:
				character.fall(i)
			else:
				character.fall(0)
			break
	if !has_ground_flag:
		character.fall(20)
	pass
