extends Camera3D

@export var rbody: RigidBody3D
var mousedX; var mousedY

func _process(delta):
	mousedX = get_viewport().get_mouse_position().x - (get_viewport().size.x/2)
	mousedY = get_viewport().get_mouse_position().y - (get_viewport().size.y/2)
	
	#rotation = rbody.angular_velocity.length() * Vector3(-mousedY,-mousedX,0) / 10000
	rotation = Vector3(-rbody.angular_velocity.x,rbody.angular_velocity.y,0) / 30
	pass
