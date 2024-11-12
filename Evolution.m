function parts_E = Evolution(parts, h, w)
    % Initialize evolved particles array
    parts_E = parts;

    % Define movement directions in degrees:
    % 90° = Up, 0° = Right, 270° = Down, 180° = Left

    % Update each particle's position and direction
    for k = 1:size(parts_E, 2)
        
        % Move particle in the current direction
        parts_E(2, k) = parts(2, k) + round(cos(deg2rad(parts_E(4, k))));
        parts_E(3, k) = parts(3, k) - round(sin(deg2rad(parts_E(4, k))));
        
        % Ensure particle remains within image boundaries
        parts_E(2, k) = max(min(parts_E(2, k), w), 1);
        parts_E(3, k) = max(min(parts_E(3, k), h), 1);
        
        % Randomly adjust particle direction
        r = randi([0, 10]);
        if r < 1
            parts_E(4, k) = mod(parts_E(4, k) + 90, 360);  % Turn right
        elseif r > 9
            parts_E(4, k) = mod(parts_E(4, k) - 90, 360);  % Turn left
        % Else: maintain current direction
        end
    end
end
