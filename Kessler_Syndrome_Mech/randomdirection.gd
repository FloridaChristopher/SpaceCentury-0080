extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = Vector3(
	randi_range(0,360),
	randi_range(0,360),
	randi_range(0,360)
	)
	pass # Replace with function body.
