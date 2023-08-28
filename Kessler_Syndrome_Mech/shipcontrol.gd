extends Node3D
class_name shipControl

@export var rigidbody: RigidBody3D
@export var maDeadzone = 50
@export var msDeadzone = 300

var MSmode = false 
var mousedX; var mousedY
#var sumForce; var sumTorque 
var totalForce: Vector3; var totalTorque: Vector3
var globalForce: Vector3; var globalTorque: Vector3

@export var thrusterSys: thrustcontrol

# Called every frame. 'delta' is the elapsed time since the previous frame.
func readInput():
	mousedX = get_viewport().get_mouse_position().x - (get_viewport().size.x/2)
	mousedY = get_viewport().get_mouse_position().y - (get_viewport().size.y/2)
	if Input.is_action_pressed("RMB"): MSmode = true
	else: MSmode = false

func _physics_process(delta):
	processInput()
	#rigidbody.totalForce = globalForce
	#rigidbody.totalTorque = globalTorque

func processInput():
	var sumForce = Vector3.ZERO
	var sumTorque = Vector3.ZERO
	readInput()
	
	if MSmode: 
		sumTorque += getTorque(msDeadzone)
	else: sumTorque += getTorque(maDeadzone)
	
	
	if Input.is_key_pressed(KEY_Q): sumTorque.z += 1
	if Input.is_key_pressed(KEY_E): sumTorque.z += -1
	
	# side to side
	if Input.is_key_pressed(KEY_A): sumForce.x += -1
	if Input.is_key_pressed(KEY_D): sumForce.x += 1
	# up and down
	if Input.is_key_pressed(KEY_R): sumForce.y += 1
	if Input.is_key_pressed(KEY_F): sumForce.y += -1
	#forward
	if Input.is_key_pressed(KEY_W): sumForce.z += -1
	if Input.is_key_pressed(KEY_S): sumForce.z += 1
	
	totalForce = sumForce
	totalTorque = sumTorque
	globalForce = convertToGlobalCoords(sumForce)
	globalTorque = convertToGlobalCoords(sumTorque)

func convertToGlobalCoords(vector:Vector3):
	var newvector = Vector3.ZERO
	newvector += global_transform.basis.x * vector.x
	newvector += global_transform.basis.y * vector.y
	newvector += global_transform.basis.z * vector.z
	return newvector


func getTorque(deadzone):
	var torque = Vector3.ZERO
	if abs(mousedX) >= deadzone:
		torque.y += -mousedX / 1000 
	if abs(mousedY) >= deadzone:
		torque.x += -mousedY / 1000
	return torque
