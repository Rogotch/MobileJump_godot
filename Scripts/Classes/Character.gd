extends KinematicBody2D

onready var _controller = player_controller.new(self)

var tween

var hp
var grid_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
#	add_child(_controller)
	add_to_group("Characters")
#	yield(get_tree().create_timer(2), "timeout")
	
	pass # Replace with function body.

func set_on_map():
	grid_position = MoveSystem.Tilemap.world_to_map(global_position)
	global_position = MoveSystem.Tilemap.map_to_world(grid_position)
	print("Set_on_map")
	pass

func move(direction : Vector2):
	MoveSystem.move(self, direction)
	prints("move_to", direction)
	pass

func can_move(direction : Vector2) -> bool:
	return true
	pass

func move_to(target):
	tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position", target, 0.3)
	tween.play()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
