function run(start,goal1,goal2,goal3)
% resize image and plot
flag = true;
mapsize = [1024,1024];
img=imread('map.jpg');
plotimg = imresize(img, mapsize);
figure;
imshow(plotimg);
% get path image
path = getpath('blackline_v2.png', 'path.png_v2.png', mapsize);
num = 1;
% get x,y of start and goals
[starty,startx] = Find_target(start);
if(starty==0 && startx==0)
    flag = false;
end
goaly=[];
goalx=[];
if goal1
[goaly,goalx] =  Find_target(goal1);
if(goaly==0 && goalx==0)
    flag = false;
end
num = num+1;
end
if goal2 
[goaly2,goalx2] = Find_target(goal2);
if(goaly2==0 && goalx2==0)
    flag = false;
end
num = num+1;
goaly = [goaly,goaly2];
goalx = [goalx,goalx2];
end
if goal3 
[goaly3,goalx3] = Find_target(goal3);
if(goaly3==0 && goalx3==0)
    flag = false;
end
num = num +1;
goaly = [goaly,goaly3];
goalx = [goalx,goalx3];
end
X = [startx,starty];
for k = 1:num-1
X = [X;goalx(k),goaly(k)];
end
% start navigation based on the start and targets 
% only if all places are right
a=10;
b=10;
if flag
    navigation(plotimg,path,X,a,b,mapsize);
end
end