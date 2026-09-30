#extends Node2D
extends  Area2D

# Called when the node enters the scene tree for the first time.
var bullet_speed:= 200
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= bullet_speed*delta
	
	if position.y<0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage()# Destroy bullet
		queue_free() # Otherwise check if it's a regular enemy
	elif area is Enemy or area.get_parent() is Enemy:
		# Regular enemy dies in 1 hit -> notify spawner
		var spawner = get_tree().root.find_child("EnemiesSpawner", true, false)
		if spawner and spawner.has_method("register_enemy_killed"):
			spawner.register_enemy_killed()
		area.queue_free() # Regular enemy dies in 1 hit
		queue_free()# Destroy bullet
	

#
#extends Area2D
#
#var bullet_speed := 200
#
#func _ready() -> void:
	#area_entered.connect(_on_area_entered)
#
#func _process(delta: float) -> void:
	#position.y -= bullet_speed * delta
	#
	#if position.y < 0:
		#queue_free()
#
#func _on_area_entered(area: Area2D) -> void:
	#if area.has_method("take_damage"):
		#area.take_damage()
		#queue_free()
	#elif area is Enemy or area.get_parent() is Enemy:
		#var spawner = get_tree().root.find_child("EnemiesSpawn", true, false)
		#if spawner and spawner.has_method("register_enemy_killed"):
			#spawner.register_enemy_killed()
		#area.queue_free()
		#queue_free()
