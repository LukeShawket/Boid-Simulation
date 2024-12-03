# Boid Simulation
This Godot script simulates a flock of boids exhibiting realistic behavior such as separation, alignment, and cohesion. The script uses ray casting to detect obstacles and adjust the boids' movement accordingly.   

Features    

• Separation: Boids steer to avoid crowding their local flock-mates.

• Alignment: Boids steer towards the average heading of local flock-mates.

• Cohesion: Boids steer to move toward the average position of local flock-mates.

• Collision Avoidance: Boids detect obstacles using rays and avoid collisions.

• Mouse Avoidance: Boids avoid the mouse cursor when right-clicked.

Parameters    

• min_speed: Minimum speed of the boids.

• max_speed: Maximum speed of the boids.

• keep_distance: Distance boids try to maintain from each other.

• alignment_weight: Influence of alignment on boid steering.

• seperation_weight: Influence of separation on boid steering.

• cohesion_weight: Influence of cohesion on boid steering.

• collision_weight: Influence of collision avoidance on boid steering.

• mouse_avoid_distance: Distance at which boids start to avoid the mouse cursor.

Usage    

1. Setup your scene:

• Add the script to an Area2D node in your Godot project.

• Ensure the node has children RayCast2D nodes for collision detection.

2. Adjust Parameters:

• You can modify the exported variables directly in the Godot editor to fine-tune the behavior of the boids.

3. Run the Simulation:

• Start the project to see the boids in action. They will exhibit realistic flocking behavior and avoid obstacles, including the mouse cursor when right-clicked.
