function [path, routesize] = multitarget(X, map, a, b)
[N,~] = size(X);
path=[];
map = drawblack(X(1,:), map, a, b);
routesize = [];
% select path with different targets based on Astar
for i = 1:N-1
    map = drawblack(X(i+1,:), map, a, b);
    usemap = ones(size(map))-map;
%     figure;
%     imshow(usemap)
    fprintf('find no.%d target!\n', i);
    [route,~] = AStar(usemap, X(i,:), X(i+1,:));
    [~,length]=size(route);
    routesize = [routesize,length];
    path = [path,route];
end

