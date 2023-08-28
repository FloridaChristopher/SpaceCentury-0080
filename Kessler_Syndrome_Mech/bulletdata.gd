extends RigidBody3D
class_name bullet


@export var muzzleVelocity: int = 100
@export var damage: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fire(initialvel:Vector3):
	linear_velocity = initialvel
	linear_velocity += global_transform.basis.z * -muzzleVelocity
func _on_timer_timeout():
	queue_free()

func hitObject():
	queue_free()
