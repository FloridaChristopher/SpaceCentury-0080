extends MWcomponent
class_name thruster

@export var mesh: MeshInstance3D
@export var body: RigidBody3D

@export var left : bool; @export var right : bool
@export var up : bool; @export var down : bool
@export var backward : bool; @export var forward : bool

@export var pitchUp : bool; @export var pitchDown : bool
@export var yawLeft : bool; @export var yawRight : bool
@export var rollLeft : bool; @export var rollRight : bool

@export var thrustForce: int = 1

func thrust(toggle:bool):
	if toggle: mesh.visible = true
	else: mesh.visible = false

func canThrust(force:Vector3):
	if force.x < 0 and right: return true
	if force.x > 0 and left: return true
	if force.y > 0 and up: return true
	if force.y < 0 and down: return true
	if force.z > 0 and backward: return true
	if force.z < 0 and forward: return true
	return false

func canTorque(force:Vector3):
	#if not vernier: return false
	if force.x < 0 and pitchDown: return true
	if force.x > 0 and pitchUp: return true
	if force.y < 0 and yawRight: return true
	if force.y > 0 and yawLeft: return true
	if force.z > 0 and rollLeft: return true
	if force.z < 0 and rollRight: return true
	return false

func useThruster(translate,rotate):
	if canThrust(translate): thrust(true)
	else: if canTorque(rotate): thrust(true)
	else: thrust(false)

func getThrust(force:Vector3):
	var thrust = Vector3(0,0,0)
	if force.x < 0 and right: thrust = Vector3(-thrustForce,0,0)
	if force.x > 0 and left: thrust = Vector3(thrustForce,0,0)
	if force.y > 0 and up: thrust = Vector3(0,thrustForce,0)
	if force.y < 0 and down: thrust = Vector3(0,-thrustForce,0)
	if force.z > 0 and backward: thrust = Vector3(0,0,thrustForce)
	if force.z < 0 and forward: thrust = Vector3(0,0,-thrustForce)
	return thrust

func local_pos(rb):
	return rb.to_local(global_position)
	
	

func getTorque(force:Vector3):
	var torque = Vector3.ZERO
	if force.x < 0 and pitchDown: 
		torque.x = force.x * thrustForce * Vector2(local_pos(body).y,local_pos(body).z).length()
	if force.x > 0 and pitchUp:
		torque.x = force.x * thrustForce * Vector2(local_pos(body).y,local_pos(body).z).length()
	if force.y < 0 and yawRight:
		torque.y = force.y * thrustForce * Vector2(local_pos(body).x,local_pos(body).z).length()
	if force.y > 0 and yawLeft:
		torque.y = force.y * thrustForce * Vector2(local_pos(body).x,local_pos(body).z).length()
	if force.z > 0 and rollLeft:
		torque.z = force.z * thrustForce * Vector2(local_pos(body).x,local_pos(body).y).length()
	if force.z < 0 and rollRight:
		torque.z = force.z * thrustForce * Vector2(local_pos(body).x,local_pos(body).y).length()
	
	return torque

func dist_to_axis(point:Vector3,axis:Vector3):
	pass
