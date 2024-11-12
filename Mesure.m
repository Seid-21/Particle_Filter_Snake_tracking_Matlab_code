function parts_Z = Mesure(parts, I)
    % Update particle weights based on the image intensity at their location
    parts_Z = parts;

    for k = 1:size(parts, 2)
        % Get particle position
        x = parts(2, k);
        y = parts(3, k);

        % Check if the particle is on a target region (red channel intensity 255)
        if I(y, x, 1) == 255
            % Check neighboring pixels to determine particle direction
            N = I(y-1:y+1, x-1:x+1, 1);  % 3x3 neighborhood around particle
            if N(3, 2) == 255        % Pixel above is red
                dir = 90;
            elseif N(2, 1) == 255    % Pixel to the right is red
                dir = 0;
            elseif N(1, 2) == 255    % Pixel below is red
                dir = 270;
            elseif N(2, 3) == 255    % Pixel to the left is red
                dir = 180;
            end

            % Determine next position based on detected direction
            x2 = 2 + round(cos(deg2rad(dir)));
            y2 = 2 - round(sin(deg2rad(dir))); 
            
            % Adjust particle weight based on alignment with direction
            if N(y2, x2) == 0
                parts_Z(1, k) = 1;  % Set moderate weight
                if mod(parts(4, k), 360) == dir
                    parts_Z(1, k) = 2;  % Increase weight if aligned with direction
                end
            else
                parts_Z(1, k) = 0.001;  % Set low weight if blocked
            end
        else
            parts_Z(1, k) = 0;  % Set weight to zero if not on target region
        end
    end
end
