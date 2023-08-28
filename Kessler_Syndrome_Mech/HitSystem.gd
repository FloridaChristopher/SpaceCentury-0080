extends Area3D
class_name hitbox

signal hit()
@export var hitflash: Timer

func _on_body_entered(body):
	if body is bullet:
		hit.emit()
		body.hitObject()
		hitflash.effectFire()
		#print("hit detected")
