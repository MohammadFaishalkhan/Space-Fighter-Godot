extends Node2D

var lives: int = 3

@onready var heart1 = get_node_or_null("../CanvasLayer/HeartContainer/Heart1")
@onready var heart2 = get_node_or_null("../CanvasLayer/HeartContainer/Heart2")
@onready var heart3 = get_node_or_null("../CanvasLayer/HeartContainer/Heart3")

#@onready var heart1 = get_tree().root.find_child("Heart1", true, false)
#@onready var heart2 = get_tree().root.find_child("Heart2", true, false)
#@onready var heart3 = get_tree().root.find_child("Heart3", true, false)

# Called when the node enters the scene tree for the first time.
var bullet_scene = preload("res://entities/bullet/bullet.tscn")
var direction:int = 0
var speed:int = 200
var player_half_width:int = 16
var shoot_time:= 0.4
var shoot_counter=0

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shoot_counter+=delta
	if Input.is_action_pressed("shoot") and shoot_counter > shoot_time:
		shoot_counter = 0
		
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position.x = position.x
		bullet_instance.position.y = position.y-25
		get_parent().get_node("Bullet").add_child(bullet_instance)		
		
		var laser = get_node_or_null("../LaserSound")
		if laser: 
				laser.play()
		
		
	if Input.is_action_pressed("slide_left"):
		direction=-1
	elif Input.is_action_pressed("slide_right"):
		direction=1
	#elif Input.is_action_pressed("slide_up"):
		#direction =+1
	#elif Input.is_action_pressed("slide_down"):
		#direction =-1
	else:
		direction=0 
		
	#position.x += direction*speed*delta
	
	#position.x += position.x+direction*speed*delta
	
	position.x=clamp(position.x+direction*speed*delta, player_half_width, 400-player_half_width)
	
func take_damage():
	lives -= 1
	print("Player took a hit! Remaining lives: ", lives)
	
	_update_heart_ui()
	
	if lives <= 0:
		_game_over()

func _update_heart_ui():
	if lives == 2 and heart3:
		heart3.visible = false
	elif lives == 1 and heart2:
		heart2.visible = false
	elif lives == 0 and heart1:
		heart1.visible = false
		
func _game_over():
	var game_over_panel = get_node_or_null("../CanvasLayer/GameOverPanel")
	if game_over_panel: 
		game_over_panel.visible = true
	print("GAME OVER!")
	get_tree().paused = true
	#queue_free()
