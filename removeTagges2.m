% This code removes tages from tagged images
% lets start step by step 
%% 1st read dicom fram
framName = 'C:\Users\Kilany\Desktop\heart\Tagging&CineSets\No_NameTagging\IM-0001-0014.dcm';
info = dicominfo(framName);
% Read image
I = dicomread(framName);
%Display with scale rule
imagesc(I);
%make image read in gray scale
colormap(gray)
%% 2nd Get fourir
A = fftshift(fft2(I));
figure,
imshow(log (abs(A)+1),[]);title('IM_1435');% select filter
%imagesc(A)
positions = [];
for elm = 1:8
    h = imrect;
    pos = getPosition(h);
    posRounded = round(pos);
    positions = [positions posRounded];
end
boxes = vec2mat(positions,4);
dims = size(A);
mask = ones(dims);
imagesc(mask);
for b = 1:8
    box = boxes(b,:);
    startX =box(1:1);
    endX = box(1:1)+box(3:3);
    startY =box(2:2);
    endY = box(2:2)+ box(4:4);
    for x = startX:endX
        for y = startY:endY
            mask(x,y) = 0;
        end
    end
end
imagesc(mask);
fourir_untaged = mask .* A;
imagesc(fourir_untaged);
invers = ifft2(fftshift(fourir_untaged));
figure
imagesc((abs((invers)))),colormap gray       % Get back original image.








