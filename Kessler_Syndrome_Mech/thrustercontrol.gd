extends MWcomponent
class_name thrustcontrol

@export var Vessel: Node3D
@export var body: RigidBody3D
var thrusters = []

var X : bool; var nX : bool
var Y : bool; var nY : bool
var Z : bool; var nZ : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	#thrusters = get_children()
	#for rocket in thrusters:
	#	rocket.body = body
	#print("found ",thrusters.size()," thrusters.")
	pass # Replace with function body.

func setThrusters(comp):
	thrusters = comp
	for rocket in thrusters:
		rocket.body = body
		

func _physics_process(delta):
	if Vessel == null: return
	if thrusters == []: return
	var thrusterForce = Vector3.ZERO
	var thrusterTorque = Vector3.ZERO
	for rocket in thrusters:
		thrusterForce += rocket.getThrust(Vessel.totalForce)
		thrusterTorque += rocket.getTorque(Vessel.totalTorque)
		rocket.useThruster(Vessel.totalForce,Vessel.totalTorque)
	
	body.totalForce = thrusterForce
	body.totalTorque = thrusterTorque
