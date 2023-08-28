extends Node3D
class_name AI

var totalForce: Vector3; var totalTorque: Vector3

@export var allegiance: int

@export var gfdgdfgdf: Node3D
var targets = []
var currentTarget


func _ready():
	targets = getTargets()
	#print("found ",targets.size()," targets")
	if targets.size() > 0:
		currentTarget = targets[0]

func getTargets():
	var temp = get_tree().get_nodes_in_group("Target")
	
	var targs = []
	for targ in temp:
		if targ.allegiance != allegiance:
			targs.append(targ)
	print("found ",targs.size()," targets")
	return targs

func _physics_process(delta):
	if currentTarget != null:
		
		totalForce = (currentTarget.global_position - get_parent().global_position).normalized()
		gfdgdfgdf.totalForce = totalForce * 1
		#if currentTarget.global_position.y > global_position.y:
		#totalForce = ()
		#totalForce = (currentTarget.global_position - global_position)
	pass
