extends KinematicBody2D

class_name Character

enum {IDLE, MOVEMENT, CLIMBED, ATTACK}

export (NodePath) var _animation_node
onready var animation_node = get_node(_animation_node)

onready var _controller = player_controller.new(self)

var tween

var hp
var grid_position : Vector2
var status = IDLE setget set_status

# Called when the node enters the scene tree for the first time.
func _ready():
#	add_child(_controller)
	add_to_group("Characters")
#	yield(get_tree().create_timer(2), "timeout")
	
	pass # Replace with function body.

func set_status(new_status):
	match new_status:
		IDLE:
			play_animation("idle")
		MOVEMENT:
			play_animation("run_r")
		CLIMBED:
			play_animation("run_up")
	pass

func set_on_map():
	grid_position = MoveSystem.Tilemap.world_to_map(global_position)
	global_position = MoveSystem.Tilemap.map_to_world(grid_position) + MoveSystem.tile_offset
	print("Set_on_map")
	pass

func move(direction : Vector2):
	MoveSystem.move(self, direction)
	if direction.x != 0 && direction.x > 0:
		animation_node.flip_h = false
	elif direction.x != 0 && direction.x < 0:
		animation_node.flip_h = true
	prints("move_to", direction)
	pass

func can_move(direction : Vector2) -> bool:
#	return MoveSystem.move_check(self, direction) && (character_status == status.IDLE || character_status == status.MOVEMENT)
	return MoveSystem.move_check(self, direction) && (status == IDLE )
	pass

func move_to(target):
	if tween != null:
		tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position", target, 0.3)
	tween.tween_callback(self, "end_of_movement")
	if MoveSystem.scene_condition == MoveSystem.CALM:
		tween.tween_callback(MoveSystem, "fall_check", [self])
	tween.play()
	pass

func end_of_movement():
	set_status(IDLE)
#	if MoveSystem.Tilemap.world_to_map(global_position) != grid_position:
#		fall(0)
	pass

func fall(count_cells : int):
	if tween != null:
		tween.kill()
	var final_target = MoveSystem.Tilemap.map_to_world(grid_position + Vector2(0, count_cells)) + MoveSystem.tile_offset
	grid_position += Vector2(0, count_cells)
	tween = create_tween().set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "position", final_target, 0.2)
	tween.play()
	pass

func play_animation(anim_name):
	animation_node.stop()
	animation_node.frame = 0
	animation_node.play(anim_name)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
