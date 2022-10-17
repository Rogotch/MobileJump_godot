extends KinematicBody2D

var tween

var hp
var grid_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Characters")
#	grid_position = MoveSystem.Tilemap
	yield(get_tree().create_timer(2), "timeout")
	tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position", Vector2(50, 20), 0.5)
	tween.play()
	pass # Replace with function body.

func Move(direction : Vector2):
	if MoveCheck(direction):
		pass
	pass

func MoveCheck(direction : Vector2) -> bool:
	return true
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
