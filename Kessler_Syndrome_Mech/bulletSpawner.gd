extends Node3D
class_name gun

@onready var timer = $Timer
@export var bulletPrefab: Resource
@export var bulletParent: Node3D
@export var rigidbody: RigidBody3D

var instance = null

var cooldown: bool = false
@export var full_auto: bool = true
@export var one_shot: bool = true
@export var spread: float = 0.01
@export var time_between_shots: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	bulletParent = get_tree().get_current_scene().get_node("BulletParent")
	timer.wait_time = time_between_shots
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if one_shot and instance != null: return
	if Input.is_action_just_pressed("LMB") and not cooldown:
		#print("pew pew")
		createBullet()
		cooldown = true
		timer.start()
		return true
	if Input.is_action_pressed("LMB") and full_auto and not cooldown:
		#print("pew pew")
		createBullet()
		cooldown = true
		timer.start()
		return true

func createBullet():
	instance = bulletPrefab.instantiate()
	bulletParent.add_child(instance)
	instance.global_position = global_position
	instance.rotation = global_rotation + Vector3(randf_range(-spread,spread),randf_range(-spread,spread),randf_range(-spread,spread))
	instance.fire(rigidbody.linear_velocity)
	


func _on_timer_timeout():
	cooldown = false
