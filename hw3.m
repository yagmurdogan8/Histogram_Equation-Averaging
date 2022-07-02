image = imread('roses2.jpg');

% in the first figure, we showed the answer of question 1.
figure

subplot(1,2,1);
imshow(image);
title('Original Image');        

hsvImage = rgb2hsv(image);        
hPlane = 360.*hsvImage(:, :, 1);   
sPlane = hsvImage(:, :, 2);        
nonRedIndex = (hPlane > 20) & (hPlane < 340);
sPlane(nonRedIndex) = 0;           
hsvImage(:, :, 2) = sPlane;        
rgbImage = hsv2rgb(hsvImage);

subplot(1,2,2);
imshow(rgbImage);
title('Red highlight');

% rgb2ntsc transforms RGB images to YIQ model:
YIQ=rgb2ntsc(image);

% in the second figure, we showed the answer of question 2.
figure

subplot(1,2,1);
imshow(YIQ);
title('YIQ');

% Histogram equation of YIQ color model:
YIQ(:,:,1)=histeq(YIQ(:,:,1));

histeqImage=ntsc2rgb(YIQ);

subplot(1,2,2);
imshow(histeqImage);
title('Histogram Equalization of YIQ');
