extends Area2D

@export var min_speed = 100.0
@export var max_speed = 500.0
@export var keep_distance = 100.0
@export var alignment_weight = 1.0
@export var seperation_weight = 1.0
@export var cohesion_weight = 1.0
@export var collision_weight = 1.0
@export var mouse_avoid_distance = 50.0
var speed
var _direction : Vector2
var _velocity
var mouse_position : Vector2


var isColliding = false

# rays
@onready var front_left_ray : RayCast2D = $Rays/RayCast2D
@onready var front_right_ray : RayCast2D = $Rays/RayCast2D2
@onready var mid_left_ray : RayCast2D = $Rays/RayCast2D5
@onready var mid_right_ray : RayCast2D = $Rays/RayCast2D6
@onready var back_left_ray : RayCast2D = $Rays/RayCast2D9
@onready var back_right_ray : RayCast2D = $Rays/RayCast2D10

var neighbors : Array
var close_boids : Array

#seperation
var final_sep_pose : Vector2
var seperation_vel : Vector2

#alignment
var final_vel : Vector2
var alignment_vel : Vector2

#cohesion
var final_co_pose : Vector2
var cohesion_vel : Vector2

# collision
var hit_point : Vector2
var avoid_direction : Vector2 = Vector2.ZERO

func _ready():
	rotation_degrees = randf_range(0, 360)
	speed = randf_range(min_speed, max_speed)
	_direction = transform.x
	_velocity = _direction
	_velocity.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position()
	#avoid mouse click
	if position.distance_to(mouse_position) <= mouse_avoid_distance:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			avoid_direction = (position - mouse_position).normalized()
	else:
		avoid_direction = Vector2.ZERO
	
	avoid()
	
	if !isColliding:
		separation()
		alignment_cohesion()
	
	movement(delta)

	
	
	out_boundaries()

func movement(frame):	
	position += (_velocity + alignment_vel + seperation_vel + cohesion_vel + avoid_direction) * frame * speed
	look_at(global_position + _velocity + alignment_vel + seperation_vel + cohesion_vel + avoid_direction)
	
	
func avoid():
	pass
			
			
func separation():
	var total_sep_pose : Vector2
	if close_boids.size() > 0:
		for boid in close_boids:
			total_sep_pose += boid.position
		final_sep_pose = total_sep_pose / close_boids.size()
		seperation_vel = ((position - final_sep_pose) * seperation_weight).normalized()
	else:
		seperation_vel = Vector2.ZERO
	

func alignment_cohesion():
	var total_pose : Vector2
	if neighbors.size() > 0:
		for boid in neighbors:
			final_vel += boid._velocity
			total_pose += boid.position
		final_co_pose = total_pose / neighbors.size()
	cohesion_vel = ((final_co_pose - position) * cohesion_weight).normalized()
	alignment_vel = (((final_vel + _velocity)/(neighbors.size() + 1)) * alignment_weight).normalized()

func out_boundaries():
	var screen_size = get_viewport_rect().size
	if position.x <= -10.0:
		position = Vector2(screen_size.x, position.y)
	if position.x >= screen_size.x + 10.0:
		position = Vector2(0, position.y)
	if position.y <= -10.0:
		position = Vector2(position.x, screen_size.y)
	if position.y >= screen_size.y + 10.0:
		position = Vector2(position.x, 0)





func _on_vision_area_entered(area):
	if area != self and area.is_in_group("Boid"):
		neighbors.append(area)


func _on_vision_area_exited(area):
	if area != self and area.is_in_group("Boid"):
		neighbors.erase(area)


func _on_area_entered(area):
	if area != self and area.is_in_group("Boid"):
		close_boids.append(area)


func _on_area_exited(area):
	if area != self and area.is_in_group("Boid"):
		close_boids.erase(area)
