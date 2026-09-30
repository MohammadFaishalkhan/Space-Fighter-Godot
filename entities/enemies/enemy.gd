class_name Enemy
extends Area2D

var speed:int = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position=Vector2(randf_range(30,380),0) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y+=speed*delta
	pass


func _on_area_entered(area: Area2D):
	if area.name == "BulletArea":
		area.get_parent().queue_free()
		queue_free()
