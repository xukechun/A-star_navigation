%%example
A=[1 0 0 1;1 1 0 0;0 0 0 0;1 0 1 1];
[route points]=AStar(A,[1,2],[3,3]);
imshow(A);

%%
% A=imread('  ');
% AA=find(A~=0);
% A(AA)=0;
