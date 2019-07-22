function [route,points] = AStar (inmap, start, goal)
%% 预处理
%输入地图中0为空闲，非0为被占，置为1   阈值可能需要修改？
%AA = imread(inmap);
%BB = find(inmap ~= 0);
%inmap(BB) = 1;

%地图大小
[row, col] = size(inmap);

%map记录点的状态：
%空闲 1
%障碍 2
%路径点 3  closed-list
%待搜索点 4 open-list
%起始点 5
%目标点 6
map = zeros(row,col);
map(~inmap) = 1;   % 空闲
map(~~inmap)  = 2;   % 被占

% 将起始点和目标点的坐标转化为map矩阵中的下标值
s_node = sub2ind(size(map), start(1), start(2));
g_node = sub2ind(size(inmap), goal(1),  goal(2));
map(s_node) = 5;
map(g_node)  = 6;

%用来记录每个节点的父节点,回溯时使用
parent = zeros(row,col);

[X, Y] = meshgrid (1:col, 1:row);
xg = goal(1);
yg = goal(2);

% 启发函数  f(n)=g(n)+h(n) g(n)为起始点到该点的距离，h(n)为该点到目标点的距离
h = abs((X - xg).^2) + abs((Y - yg).^2);  %以欧氏距离作为目标函数
h = h';

%f、g初始都设为无穷
f = Inf(row,col);
g = Inf(row,col);

g(s_node) = 0;
f(s_node) = h(s_node);

%point为A*搜索路径中路径点数
points = 0;

%% 找路径
while true
    %找出目前f中值最小的，即代价最小的,min_f为当前最小f值，current为当前点的下标值Index
    [min_f, current] = min(f(:));
    
    %如果找到了目标点，跳出循环
    if ((current == g_node) || isinf(min_f))
        break;
    end;
   
    map(current) = 3;
    f(current) = Inf; % 将该点放入closed list中，不再考虑
    points = points + 1;   %路径点加一
    % 路径点的坐标值
    [i, j] = ind2sub(size(f), current);
    
    step = [-1 0; 1 0; 0 -1; 0 1];%向上，下，左，右扩张
    
    %进行扩张
   for p = 1:4
        expand = [i,j] + step(p,:);  %当前路径点向四个方向都扩张一次,将这四个点放入open lists
        expand_x = expand(1,1);  %扩张后的x,y坐标值
        expand_y = expand(1,2);
        %不超出边界，不穿越障碍，不在close list中，也不是起始点，则进行扩张
        if ( expand_x>=1 && expand_x<=col && expand_y>=1 && expand_y<=row && map(expand_x,expand_y)~=2 && map(expand_x,expand_y)~=3 && map(expand_x,expand_y)~=5)
            if ( g(expand_x,expand_y)> g(i,j)+1 )  
                g(expand_x,expand_y)= g(i,j)+1;
                f(expand_x,expand_y)= g(expand_x,expand_y)+h(expand_x,expand_y);
                parent(expand_x,expand_y)=current;  %父节点设为扩张的路径点
                map(expand_x,expand_y)=4;  %openlist
            end
        end
    end
end
%% 找到路径后回溯
    if (isinf(f(g_node)))
    route = [];
else
    route = [g_node];
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

end

end
    
    

