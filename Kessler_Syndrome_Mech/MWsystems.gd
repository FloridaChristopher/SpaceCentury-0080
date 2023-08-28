extends Node3D
class_name MWsystems

var components = []

var thrusters = []
var fueltanks = []
var hardpoints = []
@export var thrustCntrl: Node3D

var turrets = []

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr

func getComponents():
	var temp = []
	var parts = []
	get_all_children(get_parent(),temp)
	for item in temp:
		if item.is_in_group("MWcomponent"):
			parts.push_back(item)
			item.MWsystem = self
	print("Found ",parts.size()," components.")
	return parts

func sortComponents():
	thrusters = []; fueltanks = []
	for comp in components:
		if comp is thruster: thrusters.push_back(comp)
		if comp is fueltank: fueltanks.push_back(comp)
		if comp is turret: fueltanks.push_back(comp)
		if comp is thrustcontrol: thrustCntrl = comp
		
	print(thrusters.size()," were thruster components.")
	print(fueltanks.size()," were fuel tank components.")
	if thrustCntrl != null: print("Thrustercontrol found.")
	
func _ready():
	components = getComponents()
	sortComponents()
	#thrustCntrl.thrusters = thrusters
	thrustCntrl.setThrusters(thrusters)
