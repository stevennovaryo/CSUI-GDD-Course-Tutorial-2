extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawnExplosion(body: KinematicBody2D):
	body.goExplode()

func _on_SpikeArea_body_entered(body: KinematicBody2D):
	if body != null && body.name == "GreenShip":
		spawnExplosion(body)
		
