# Boid Simulation
This Godot script simulates a flock of boids exhibiting realistic behavior such as separation, alignment, and cohesion.     
# Screenshots:
![1](https://github.com/user-attachments/assets/567aa99d-1631-4c08-8fcc-c6f38b192d58)
![2](https://github.com/user-attachments/assets/74f1553f-a1d1-4670-90f9-10f0fe84ec2c)

Features    

• Separation: Boids steer to avoid crowding their local flock-mates.

• Alignment: Boids steer towards the average heading of local flock-mates.

• Cohesion: Boids steer to move toward the average position of local flock-mates.

• Collision Avoidance: Boids detect obstacles using rays and avoid collisions.

• Mouse Avoidance: Boids avoid the mouse cursor when right-clicked.


Usage    

1. Setup your scene:

• Add the script to an Area2D node in your Godot project.

• Ensure the node has children RayCast2D nodes for collision detection.

2. Adjust Parameters:

• You can modify the exported variables directly in the Godot editor to fine-tune the behavior of the boids.

3. Run the Simulation:

• Start the project to see the boids in action.
