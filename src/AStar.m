function [route,points] = AStar (inmap, start, goal)
%% Ԥ����
%�����ͼ��0Ϊ���У���0Ϊ��ռ����Ϊ1   ��ֵ������Ҫ�޸ģ�
%AA = imread(inmap);
%BB = find(inmap ~= 0);
%inmap(BB) = 1;

%��ͼ��С
[row, col] = size(inmap);

%map��¼���״̬��
%���� 1
%�ϰ� 2
%·���� 3  closed-list
%�������� 4 open-list
%��ʼ�� 5
%Ŀ��� 6
map = zeros(row,col);
map(~inmap) = 1;   % ����
map(~~inmap)  = 2;   % ��ռ

% ����ʼ���Ŀ��������ת��Ϊmap�����е��±�ֵ
s_node = sub2ind(size(map), start(1), start(2));
g_node = sub2ind(size(inmap), goal(1),  goal(2));
map(s_node) = 5;
map(g_node)  = 6;

%������¼ÿ���ڵ�ĸ��ڵ�,����ʱʹ��
parent = zeros(row,col);

[X, Y] = meshgrid (1:col, 1:row);
xg = goal(1);
yg = goal(2);

% ��������  f(n)=g(n)+h(n) g(n)Ϊ��ʼ�㵽�õ�ľ��룬h(n)Ϊ�õ㵽Ŀ���ľ���
h = abs((X - xg).^2) + abs((Y - yg).^2);  %��ŷ�Ͼ�����ΪĿ�꺯��
h = h';

%f��g��ʼ����Ϊ����
f = Inf(row,col);
g = Inf(row,col);

g(s_node) = 0;
f(s_node) = h(s_node);

%pointΪA*����·����·������
points = 0;

%% ��·��
while true
    %�ҳ�Ŀǰf��ֵ��С�ģ���������С��,min_fΪ��ǰ��Сfֵ��currentΪ��ǰ����±�ֵIndex
    [min_f, current] = min(f(:));
    
    %����ҵ���Ŀ��㣬����ѭ��
    if ((current == g_node) || isinf(min_f))
        break;
    end;
   
    map(current) = 3;
    f(current) = Inf; % ���õ����closed list�У����ٿ���
    points = points + 1;   %·�����һ
    % ·���������ֵ
    [i, j] = ind2sub(size(f), current);
    
    step = [-1 0; 1 0; 0 -1; 0 1];%���ϣ��£���������
    
    %��������
   for p = 1:4
        expand = [i,j] + step(p,:);  %��ǰ·�������ĸ���������һ��,�����ĸ������open lists
        expand_x = expand(1,1);  %���ź��x,y����ֵ
        expand_y = expand(1,2);
        %�������߽磬����Խ�ϰ�������close list�У�Ҳ������ʼ�㣬���������
        if ( expand_x>=1 && expand_x<=col && expand_y>=1 && expand_y<=row && map(expand_x,expand_y)~=2 && map(expand_x,expand_y)~=3 && map(expand_x,expand_y)~=5)
            if ( g(expand_x,expand_y)> g(i,j)+1 )  
                g(expand_x,expand_y)= g(i,j)+1;
                f(expand_x,expand_y)= g(expand_x,expand_y)+h(expand_x,expand_y);
                parent(expand_x,expand_y)=current;  %���ڵ���Ϊ���ŵ�·����
                map(expand_x,expand_y)=4;  %openlist
            end
        end
    end
end
%% �ҵ�·�������
    if (isinf(f(g_node)))
    route = [];
else
    route = [g_node];
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

end

end
    
    

