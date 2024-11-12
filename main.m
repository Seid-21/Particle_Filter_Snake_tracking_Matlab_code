close all; clear; clc;

%% Variables
path = '../snake_color/snake_%04d.png';  % File path for images
output_folder = './track/';  % Folder to save tracking images
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end
n_stop  = 1018;  % Last image number
n_start = 1;     % Starting image number
npart = 2000;    % Number of particles
nsample = 1000;  % Number of samples for resampling
nselect = 1;     % Number of particles to select
radiusp = 24;    % Radius for sampling, must be even

%% Display settings
f1 = figure;
f1.WindowState = 'maximized';

%% Particle Initialization
image = imread(sprintf(path, 0));  % Read the first image
[h, w, c] = size(image);
parts = zeros(6, npart);

for k = 1:npart
   parts(1, k) = 1 / npart;            % Initial weight
   parts(2, k) = randi([2, w - 1]);    % Random x position
   parts(3, k) = randi([2, h - 1]);    % Random y position

   % Initialize direction and previous weights
   parts(4, k) = randi([0, 3]) * 90;  % Random direction
   parts(5, k) = 1 / npart;           % Weight at previous iteration
   parts(6, k) = 2 / npart;           % Cumulative weight over two iterations
end

%% Image Processing Loop
for im = n_start:n_stop
    %% Image Reading
    image = imread(sprintf(path, im));

    %% Prediction Step
    parts = Evolution(parts, h, w);

    %% Measurement Step
    parts = Mesure(parts, image);
    
    %% Center of Mass Calculation
    avx = 1;
    avy = 1;
    if sum(parts(6, :) >= 3) > 0
        c = parts .* (parts(6, :) >= 3);
        avx = round(sum(c(2, :) .* c(6, :)) / sum(c(6, :)));
        avy = round(sum(c(3, :) .* c(6, :)) / sum(c(6, :)));
    end

    %% Resampling
    parts = Sampling(parts, h, w, nsample, nselect, radiusp);

    %% Weight Propagation
    parts(5, :) = parts(1, :);
    
    %% Display Results
    image(:, :, 2) = 0;  % Remove green channel

    for k = 1:npart
        image(parts(3, k), parts(2, k), 3) = 255;  % Mark particles in blue
    end

    % Mark center of mass with a green dot
    image(avy, avx, 2) = 255;

    imshow(image, 'InitialMagnification', 'fit')
    title(sprintf("Image %d/%d", im, n_stop))

    % Save image if particles are following the snake
    if sum(parts(6, :) >= 3) > 0
        saveas(gcf, fullfile(output_folder, sprintf('tracked_image_%04d.png', im)));
    end

    pause(0.1);
end
