
% Setup
close all;
x=0:1:10;
axis([0,10,-4,4]);

plotv([1;0],'->');

% Four vectors that specify the red and blue line segments
top_red = [4;1];
bot_red = [4;-1];
top_blue = [8;2];
bot_blue = [8;-2];

% Draw the segments
line([top_red(1), bot_red(1)],[top_red(2) bot_red(2)],'Color',[1,0,0]);
line([top_blue(1), bot_blue(1)],[top_blue(2) bot_blue(2)],'Color',[0,0,1]);

% Draw dashed black lines to show what a perspective projection would see
line(x,x/4,'Color',[0,0,0],'LineStyle','--');
line(x,-x/4,'Color',[0,0,0],'LineStyle','--');

% Draw dashed horizontal lines show what an orthogonal projection would see
line(0:0.1:4,ones(1,41),'Color',[1,0,0],'LineStyle','--');
line(0:0.1:8,2*ones(1,81),'Color',[0,0,1],'LineStyle','--');
line(0:0.1:4,-1*ones(1,41),'Color',[1,0,0],'LineStyle','--');
line(0:0.1:8,-2*ones(1,81),'Color',[0,0,1],'LineStyle','--');

figure;
cat_pts=[top_blue bot_blue top_red bot_red]
scatter(cat_pts(1,:), cat_pts(2,:));
xlim([-1 10]);
ylim([-4 4]);

camera = [0 0 0; 0 1 0; 1 0 0]
hom_pts = vertcat(cat_pts,ones(1,size(cat_pts,2)))

figure;
per_pts = camera*hom_pts
per_pts(1,:) = per_pts(1,:) ./ per_pts(3,:);
per_pts(2,:) = per_pts(2,:) ./ per_pts(3,:);
per_pts(3,:) = per_pts(3,:) ./ per_pts(3,:);
per_pts

scatter(per_pts(1,:), per_pts(2,:));
xlim([-1 10]);
ylim([-4 4]);

