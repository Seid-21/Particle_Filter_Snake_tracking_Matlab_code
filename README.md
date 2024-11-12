
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
   ```

   - The script reads images from `snake_color`, processes them using the particle filter, and saves the output images to the `track` folder.

### 3. Check Output

- After the script completes, check the `track` folder for saved images. Each saved image shows the tracking progress, with particles aligned to the snake. Images are saved with the frame number, e.g., `tracked_image_0001.png`.

## How the Particle Filter Works

1. **Initialization**: Particles are randomly initialized within image bounds, each assigned an initial weight.
2. **Prediction**: Particles move according to a random movement model.
3. **Measurement**: Particle positions are compared to the snake’s position in the image.
4. **Resampling**: Particles with higher weights are more likely to be selected to form new particles.
5. **Repetition**: The process repeats for each image frame, adjusting particle positions to improve tracking accuracy.

## Notes

- Adjustable parameters:
  - **Number of particles** (`npart`)
  - **Number of samples** (`nsample`)
  - **Resampling radius** (`radiusp`)
- The script assumes the snake appears consistently in each image and that particles can estimate its position.

## Troubleshooting

### Issue: Images Are Not Being Saved

- Ensure the `track` folder exists, or the script will attempt to create it. If folder creation fails, check your write permissions in the directory.
- If no images are saved, verify the measurement step in the script to ensure particles are aligning with the snake.

### Issue: Images Don’t Display or Script Runs Slowly

- Check that your MATLAB environment has sufficient memory for processing large images or many particles.
- To improve performance, reduce the number of particles (`npart`) or the number of frames being processed.
```

---

