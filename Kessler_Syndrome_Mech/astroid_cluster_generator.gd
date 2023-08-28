extends Node3D

@export var asteroid: Resource
@export var number: int
@export var size: int = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	generateField()
	pass # Replace with function body.


func generateField():
	for i in range(number):
		var instance = asteroid.instantiate()
		add_child(instance)
		instance.position = Vector3(
			randi_range(-size,size),
			randi_range(-size,size),
			randi_range(-size,size))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
