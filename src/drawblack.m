function [out] = drawblack(X,path,a,b)
%DRAWBLACK 此处显示有关此函数的摘要
%   此处显示详细说明
x=X(1);
y=X(2);
for i = 0:a
    for j = 0:b
        path(x-i,y-j) = 1;
        path(x+i,y+j) = 1;
        path(x-i,y+j) = 1;
        path(x+i,y-j) = 1;
    end
end
out = path;

