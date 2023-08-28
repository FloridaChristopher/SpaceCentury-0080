extends RigidBody3D
class_name shipPhys

var totalForce: Vector3 = Vector3.ZERO
var totalTorque: Vector3 = Vector3.ZERO

var globalForce: Vector3 = Vector3.ZERO

@export var localForce: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state):
	if localForce: applyLocalForceNTorque(
		convertToGlobalCoords(totalForce),
		convertToGlobalCoords(totalTorque)
		)
	else: applyForceNTorque(
		totalForce, totalTorque
	)

func applyForceNTorque(force,torque):
	apply_force(force)
	apply_torque(torque)

func applyLocalForceNTorque(force,torque):
	apply_force(force)
	apply_torque(torque)

func convertToGlobalCoords(vector:Vector3):
	var newvector = Vector3.ZERO
	newvector += global_transform.basis.x * vector.x
	newvector += global_transform.basis.y * vector.y
	newvector += global_transform.basis.z * vector.z
	return newvector
