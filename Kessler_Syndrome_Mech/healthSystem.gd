extends Node3D
class_name healthSystem

@export var maxHP: int = 5
var currentHP = 5
var hitboxes
@export var destroyOnDie: bool = true
@export var particleSys: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	currentHP = maxHP
	hitboxes = get_children()
	for n in hitboxes:
		n.hit.connect(gotHit)
	pass # Replace with function body.


func gotHit():
	currentHP -= 1
	if currentHP <= 0:
		print(name + " was destroyed")
		destroy()
	pass

func destroy():
	if particleSys != null: 
		var instance = particleSys.instantiate()
		get_tree().root.add_child(instance)
		instance.position = global_position
		instance.emitting = true
	if destroyOnDie: queue_free()
