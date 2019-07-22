function result= navigation(plotimg,path,X,a,b,mapsize)

% plotpath = imresize(path,mapsize);
% figure;
% imshow(plotpath);
% get path
[route, routesize] = multitarget(X, path, a, b);
% build colorful path
redone = 0;
greenone =0;
blueone = 0;
[~,bound]=size(routesize);
routesize=[1,routesize];
start = 0;
for k = 1:bound
color = zeros(mapsize);
color(route(routesize(k):routesize(k+1))) = 1;
num = routesize(k+1);
start = start+routesize(k);
% draw a square on every path point
for i=1:20:num
    temp = route(start+i);
    [j,l] = ind2sub(size(color), temp);
    temp = [j,l];
    color = drawblack(temp,color,5,5);
end
fprintf('processing map...\n');
% drawing different color
rgb = zeros([1024,1024,3]);
rgb(:,:,1) = 10*color*k;
rgb(:,:,2) = 100*color*k;
rgb(:,:,3) = 1000*color*k;
if k==1
    rplotimg = double(plotimg);
    rplotimg(rgb==10*k) = 255;
    rplotimg(rgb==100*k) = 0;
    rplotimg(rgb==1000*k) = 0;
    redone = rplotimg;
end
if k==2
    gplotimg = double(plotimg);
    gplotimg(rgb==10*k) = 0;
    gplotimg(rgb==100*k) = 255;
    gplotimg(rgb==1000*k) = 0;
    greenone = gplotimg;
end
if k==3
    bplotimg = double(plotimg);
    bplotimg(rgb==10*k) = 0;
    bplotimg(rgb==100*k) = 0;
    bplotimg(rgb==1000*k) = 255;
    blueone = bplotimg;
end
end
% colorful path fusion and plot
plotimg = (redone+greenone+blueone)/k;
plotimg = uint8(plotimg);
fprintf('finish processing!\n');
figure;
imshow(plotimg);
end

