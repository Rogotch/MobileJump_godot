extends controller

class_name player_controller

func _init(contr_obj : Object):
	controlled_object = contr_obj
	contr_obj.add_child(self)
#	if contr_obj.has_method("set_controller")
	pass

func _unhandled_input(event):
	if event is InputEventMouse:
		return
	
	var final_direction = Vector2.ZERO
	
	if event.is_action_released("move_left"):
		final_direction += Vector2.LEFT
	if event.is_action_released("move_right"):
		final_direction += Vector2.RIGHT
	if event.is_action_released("move_up"):
		final_direction += Vector2.UP
	if event.is_action_released("move_down"):
		final_direction += Vector2.DOWN
	
	if final_direction.abs().length() > 0:
		move(final_direction)
	
	
#	if event.is_action_released("ui_left"):
#		pass
	pass
