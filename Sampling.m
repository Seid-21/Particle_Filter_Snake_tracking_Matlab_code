function parts_S = Sampling(parts, h, w, nsample, nselect, radiusp)
    % Update particle weights by combining current and previous weights
    parts(6,:) = parts(1,:) + parts(5,:);
    parts_S = parts;
    npart = size(parts, 2);

    % Check if particles have varying weights
    if min(parts(6,:)) ~= max(parts(6,:))
        
        % Sort particles based on their weight in ascending order
        parts_S = sortrows(parts', 6)';
        
        for k = 1:nsample
            
            % Randomly select a "parent" particle from the top-weighted particles
            father = randi([npart - nselect + 1, npart]);
            
            stop = 0;
            while stop == 0
                % Generate a random offset for the child particle
                dx = round(randn() * radiusp / 4);
                dy = round(randn() * radiusp / 4);
                
                % Adjust offset based on the parent's direction
                if parts_S(4, father) == 90 || parts_S(4, father) == 270
                    dx = round(dx / 2);  % Limit horizontal movement
                else
                    dy = round(dy / 2);  % Limit vertical movement
                end
                
                % Set new position for the child particle
                parts_S(2, k) = parts_S(2, father) + dx;
                parts_S(3, k) = parts_S(3, father) + dy;
                stop = 1;

                % Ensure the particle stays within image boundaries
                if parts_S(2, k) < 1 || parts_S(2, k) > w
                    stop = 0;
                end
                if parts_S(3, k) < 1 || parts_S(3, k) > h
                    stop = 0;
                end
            end
        end
    end
end
