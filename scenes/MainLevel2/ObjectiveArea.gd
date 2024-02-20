extends Area2D

func spawnExplosion():
	var new_node = preload("res://scenes/explosion.tscn").instance()
	get_parent().add_child(new_node)

func moveToLevel2():
	# var new_scene = preload("res://scenes/MainLevel2/MainLevel2.tscn")
	get_tree().change_scene("res://scenes/MainLevel2/MainLevel2.tscn")


func _on_ObjectiveArea_body_entered(body: KinematicBody2D):
	if (body.name == "GreenShip"):
		print("Reached objective!")
		spawnExplosion()
		moveToLevel2()
		
	

func _on_BlueShip_mouse_entered():
	print("cursor mouse")
	pass # Replace with function body.
