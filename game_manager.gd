extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/TextureButton.pressed.connect(_on_button_pressed)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_button_pressed():
	#print("Button clicked!")
	get_tree().paused = false
	get_tree().reload_current_scene()
