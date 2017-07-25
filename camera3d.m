

% Setup
close all;
camera_vector = [1; 0; 0];
camera_vector = camera_vector/norm(camera_vector)
line([0 camera_vector(1)],[0 camera_vector(2)],[0 camera_vector(3)]);
view(-30,15);
axis([-2,8,-2,2,-2,2]);
axis equal

red_square = [4 4 4 4; 1 1 -1 -1; 1 -1 -1 1]
blue_square = red_square + [2 2 2 2; 0 0 0 0; 0 0 0 0]
red_square_draw = [red_square red_square(:,1)]
blue_square_draw = [blue_square blue_square(:,1)]
line(red_square_draw(1,:), red_square_draw(2,:), red_square_draw(3,:), 'Color',[1,0,0])
line(blue_square_draw(1,:), blue_square_draw(2,:), blue_square_draw(3,:), 'Color',[0,0,1])

red_orth = red_square_draw(2:3,:)
blue_orth = blue_square_draw(2:3,:)

easel = null(transpose(camera_vector)) % ONB for the easel plane
to_easel_basis = [easel camera_vector]
camera_proj = to_easel_basis*[1 0 0; 0 1 0; 0 0 0]*inv(to_easel_basis);

camera = [vertcat(camera_proj,transpose(camera_vector)) zeros(4,1)]
%camera = [0 0 0 0; 0 1 0 0; 0 0 1 0; 1 0 0 0;]

hom_pts = vertcat([red_square blue_square],ones(1,2*size(red_square,2)))

per_pts = camera*hom_pts
per_pts(1,:) = per_pts(1,:) ./ per_pts(4,:);
per_pts(2,:) = per_pts(2,:) ./ per_pts(4,:);
per_pts(3,:) = per_pts(3,:) ./ per_pts(4,:);
per_pts(4,:) = per_pts(4,:) ./ per_pts(4,:);
per_pts

view(-30,15);
axis([0,8,-2,2,-2,2]);
red_pts = per_pts(1:3,1:4)
red_draw = [red_pts red_pts(:,1)]
line(red_draw(1,:), red_draw(2,:), red_draw(3,:), 'Color',[1,0,0])
blue_pts = per_pts(1:3,5:8)
blue_draw = [blue_pts blue_pts(:,1)]
line(blue_draw(1,:), blue_draw(2,:), blue_draw(3,:), 'Color',[0,0,1])
%line([0,0,0,0,0],blue_square_draw(2,:), blue_square_draw(3,:), 'Color',[0,0,1])
%line([0,0,0,0,0],red_square_draw(2,:), red_square_draw(3,:), 'Color',[1,0,0])

% % Draw the orthogonal proj of the squares
% figure;
% axis([-3,3,-3,3]);
% axis equal;
% line(blue_square_draw(2,:), blue_square_draw(3,:), 'Color',[0,0,1])
% line(red_square_draw(2,:), red_square_draw(3,:), 'Color',[1,0,0])

% figure;
% axis([-.5,.5,-.5,.5]);
% axis equal;
% line(red_final_draw(2,:), red_final_draw(3,:), 'Color',[1,0,0])
% line(blue_final_draw(2,:), blue_final_draw(3,:), 'Color',[0,0,1])
