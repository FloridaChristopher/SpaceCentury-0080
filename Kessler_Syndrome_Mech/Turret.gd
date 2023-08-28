extends MWcomponent
class_name turret

@export var camera: Camera3D
var mousepos
var parent
# Called when the node enters the scene tree for the first time.
func _ready():
	mousepos = get_viewport().get_mouse_position()
	print("mousepos : ",mousepos)
	parent = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('RMB'):
		mousepos = get_viewport().get_mouse_position()
		var aimpos = camera.project_position(mousepos,1000)
		look_at(aimpos,parent.transform.basis.y)
		#look_at(aimpos,origional_up)
		
	else:
		rotation = Vector3.ZERO
		pass
