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



func _on_area_entered(area: Area2D):
	#if area.name == "BulletArea":
	if area.name == "Player" or area.has_method("take_damage"):
		area.take_damage()
		#area.get_parent().queue_free()
		queue_free()
