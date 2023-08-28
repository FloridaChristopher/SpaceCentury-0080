extends MWcomponent
class_name fueltank

var fuel: float
var totalfuel = 100

func _init():
	fuel = totalfuel

func canDrainAmount(amount:float):
	if fuel <= 0: return 0
	if amount >= fuel: return fuel
	if amount < fuel: return amount

func drainAmount(amount:float):
	if fuel <= 0: return false
	fuel -= canDrainAmount(amount)
	return true
