extends Node2D

var boid = "res://Scenes/fish.tscn"
var canSpawn = true
var spawn_delay = 0.0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canSpawn:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			var instance = load(boid)
			var fish = instance.instantiate()
			fish.position = get_global_mouse_position()
			add_child(fish)
			canSpawn = false
	else:
		spawn_delay += delta
		if spawn_delay >= 0.5:
			canSpawn = true
			spawn_delay = 0.0
		
