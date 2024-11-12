% Find the index of the particle located at position (69, 51)
k = find(parts(2, :) == 69 & parts(3, :) == 51);

% Read and display the current image
I = imread(sprintf(path, im));
figure;
imshow(I, []);  % Display image with automatic scaling

% Display the x and y coordinates of the found particle
x = parts(2, k);
y = parts(3, k);
