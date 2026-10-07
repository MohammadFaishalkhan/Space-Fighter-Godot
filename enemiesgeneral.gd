extends Area2D
class_name enemiesgeneral

var speed:int = 140
var health:int = 3
 
@onready  var health_bar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready():
	#position = Vector2(randf_range(30, 380),0)
	position.x = randf_range(30, 380)
	if health_bar:
		health_bar.max_value = health
		health_bar.value = health
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.y += speed*delta
	

func take_damage():
	health -= 1
	if health_bar: health_bar.value = health
	if health <= 0:
		var spawner = get_tree().root.find_child("EnemiesSpawner", true, false)
		if spawner and spawner.has_method("add_score"):
			spawner.add_score(100)
			
		queue_free()
