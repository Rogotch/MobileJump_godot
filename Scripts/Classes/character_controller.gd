extends Node

class_name controller

var controlled_object

#
#func _init(contr_obj : Object):
#	controlled_object = contr_obj
##	if contr_obj.has_method("set_controller")
#	pass

func move(direction : Vector2):
	if controlled_object.can_move(direction):
		controlled_object.move(direction)
	pass

func move_to(target : Vector2):
	if controlled_object.can_move_to(target):
		controlled_object.move_to(target)
	pass
