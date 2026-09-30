extends Node
var enemy_scene = preload("res://entities/enemies/enemy.tscn") 
var enemies_general_scene = preload("res://entities/enemies/enemiesgeneral.tscn")

var kill_count:int = 0
var kill_until_enemies_general:int = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Boundary").connect("area_entered", _the_end)	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.connect("timeout", _create_enemy)
	timer.start()
	#pass # Replace with function body.

func _create_enemy():
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)
	#pass
func register_enemy_killed():
	kill_count += 1
	print("Kills: ", kill_count) # Check output window when shooting enemies
	if kill_count >= kill_until_enemies_general:
		print("SPAWNING BOSS NOW!")
		_spawn_enemies_general()
		kill_count = 0
		
func _spawn_enemies_general():
	var enemies_general = enemies_general_scene.instantiate()
	#enemies_general.position = Vector2(180, 50)
	get_parent().get_node("Enemies").call_deferred("add_child", enemies_general)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
func _the_end(body:Node):
	if body is Enemy or body is enemiesgeneral:
		get_tree().set_pause(true)
	
