# Particle Filter Snake Tracking

This project implements a **particle filter** algorithm to track a snake in a sequence of images. The algorithm uses a set of particles, randomly distributed across the image, to estimate the snake's position based on image measurements. Over time, the particles adjust their positions to align more accurately with the snake in each subsequent frame.

## Features

- **Particle filter** for tracking the snake's position across frames.
- **Resampling** step to adjust particle weights and improve tracking accuracy.
- **Image saving** feature to monitor progress by saving frames where the particles align with the snake.
- Saved output images are stored in a folder called `track`.

## Requirements

Before running the project, ensure you have the following installed:
- **MATLAB**

## Getting Started

### 1. Prepare Your Dataset

- Ensure you have a folder named `snake_color` containing images of the snake, named in the format `snake_0001.png`, `snake_0002.png`, etc.
- Place the `snake_color` folder inside the project directory (`Particle_Filter_Snake_Tracking`).

### 2. Run the Script

1. Open **MATLAB**.
2. Navigate to the project directory in the MATLAB command window using `cd`.
3. Run the main script:

   ```matlab
   % Example MATLAB code to navigate and run
   cd 'path_to_project/Particle_Filter_Snake_Tracking'
   run('main_script_name.m') % Replace with the actual script name
