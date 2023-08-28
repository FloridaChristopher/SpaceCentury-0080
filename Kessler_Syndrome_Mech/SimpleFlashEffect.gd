extends Timer
class_name flasheffect

@export var mesh: MeshInstance3D
@export var flashMaterial: StandardMaterial3D

func effectFire():
	mesh.material_override = flashMaterial
	start()

func _on_timeout():
	mesh.material_override = null
	pass # Replace with function body.
