% smart_cleaning_robot_bfs.m
clc; clear; close all;

%% --- Room Setup ---
roomSize = [20, 20];
room = ones(roomSize); % 1 = dirty, 0 = clean, -1 = obstacle

% Add obstacles
room(5:6, 10:13) = -1;
room(15, 3:7) = -1;
room(10:11, 17:18) = -1;
room(8:12, 8:9) = -1;
room(2:3, 15:16) = -1;

%% --- Robot Initialization ---
robot.pos = [2, 2];
robot.path = robot.pos;

maxSteps = 3000;
step = 0;

%% --- Main Loop ---
while step < maxSteps
    % Clean current tile
    x = robot.pos(1); y = robot.pos(2);
    if room(x, y) == 1
        room(x, y) = 0;
    end

    % Check if all cleaned
    if all(room(room~=-1) == 0)
        fprintf("🎉 All clean in %d steps!\n", step);
        break;
    end

    % Find nearest dirty tile
    targetPath = bfsToNearestDirty(robot.pos, room);
    if isempty(targetPath)
        disp("No reachable dirty tiles remaining.");
        break;
    end

    % Move one step toward target
    if size(targetPath, 1) > 1
        robot.pos = targetPath(2, :);  % move 1 step
        robot.path(end+1, :) = robot.pos;
    end

    % --- Visualization ---
    clf;
    imagesc(room);
    colormap([1 1 1; 0.8 0.8 0.8; 0.2 0.2 0.2]); % Clean, Dirty, Obstacle
    hold on;
    plot(robot.path(:,2), robot.path(:,1), 'b.-'); % path
    plot(robot.pos(2), robot.pos(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    title(sprintf('Step: %d | Cleaned: %.2f%%', step, ...
        100 * sum(room(:)==0) / sum(room(:)~=-1)));
    axis equal tight;
    drawnow;

    step = step + 1;
end

%% --- Function: Is Valid Move ---
function valid = isValidMove(pos, room)
    [r, c] = size(room);
    x = pos(1); y = pos(2);
    valid = x >= 1 && x <= r && y >= 1 && y <= c && room(x, y) ~= -1;
end

%% --- Function: BFS to Nearest Dirty Tile ---
function path = bfsToNearestDirty(startPos, room)
    queue = {startPos};
    visited = false(size(room));
    parent = containers.Map();  % key = 'x_y', value = parent string
    visited(startPos(1), startPos(2)) = true;

    directions = [0 1; 1 0; 0 -1; -1 0]; % R, D, L, U

    while ~isempty(queue)
        curr = queue{1};
        queue(1) = [];

        if room(curr(1), curr(2)) == 1
            % Found nearest dirty tile — backtrack path
            path = [curr];
            key = sprintf('%d_%d', curr(1), curr(2));
            while isKey(parent, key)
                keyVal = parent(key);
                parts = sscanf(keyVal, '%d_%d');
                path = [parts'; path];
                key = keyVal;
            end
            return;
        end

        for i = 1:4
            next = curr + directions(i,:);
            if isValidMove(next, room) && ~visited(next(1), next(2))
                visited(next(1), next(2)) = true;
                queue{end+1} = next;
                parentKey = sprintf('%d_%d', next(1), next(2));
                currKey = sprintf('%d_%d', curr(1), curr(2));
                parent(parentKey) = currKey;
            end
        end
    end

    path = []; % No path found
end
