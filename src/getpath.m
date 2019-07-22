function [path] = getpath(img_name, saved_name, img_size)
% the input img_name is the path to your image(which will be resized), and
% the output is the path selected which will be saved as saved_name
% 1 in path indicates path 

img=imread(img_name);

% resize the image
img = imresize(img, img_size);

% convert the RGB image to grayscale based on the formula
gray = (0.289 * (img(:,:,1)+ 0.587 * img(:,:,2) + 0.114 * img(:,:,3)))/3;

% get the path
path = ones(size(gray)) .* (gray < 1);

% save the path
imwrite(path, saved_name);

end

