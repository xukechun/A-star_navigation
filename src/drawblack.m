function [out] = drawblack(X,path,a,b)
%DRAWBLACK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

