#extends Node
#var enemy_scene = preload("res://entities/enemies/enemy.tscn")
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#var timer = Timer.new()
	#add_child(timer)
	#timer.wait_time = 1.5
	#timer.connect("timeout",_create_enemy())
	#timer.start()
	#
#func _create_enemy():
	#var enemy = enemy_scene.instantiate()
	#get_parent().get_node("Enemie").get_child(enemy)
	#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta: float) -> void:
	##pass
