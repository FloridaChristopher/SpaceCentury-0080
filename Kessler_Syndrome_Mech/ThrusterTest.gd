extends Node3D

@export var rbody: RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("LMB"):
		rbody.apply_force(global_transform.basis.z, global_position - rbody.global_position)
	if Input.is_action_pressed("RMB"):
		rbody.apply_force(-global_transform.basis.z, global_position - rbody.global_position)

func euler_to_vector(rotation):
	var vec = Vector3.ZERO
	vec.x = cos(rotation.x)*cos(rotation.y)
	vec.y = sin(rotation.x)*cos(rotation.y)
	vec.z = sin(rotation.y)
	return vec
