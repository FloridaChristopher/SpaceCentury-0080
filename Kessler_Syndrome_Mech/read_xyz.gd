extends RichTextLabel

@export var player: RigidBody3D

func _process(delta):
	text = "X,Y,Z: " + str(round(player.position.x)) + " " + str(round(player.position.y)) + " " + str(round(player.position.z)) + "\ndX,dY,dZ: " + str(round(player.linear_velocity.x)) + " " + str(round(player.linear_velocity.y)) + " " + str(round(player.linear_velocity.z))
