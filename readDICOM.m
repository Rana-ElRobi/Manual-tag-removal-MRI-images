%When using dicomread, you can specify the filename as an argument, 
%as in the following example. The example reads the sample DICOM file that is included with the toolbox.
%I = dicomread('C:\Users\Kilany\Desktop\RS\DICOM\export0001.dcm');
%You can also use the metadata structure returned by dicominfo to specify the file you want to read, as in the following example.

info = dicominfo('C:\Users\Kilany\Desktop\RS\DICOM\export0001.dcm');
%imgPosition = info.ImagePosition;
%imageOriantation = info.ImageOrientation;
imgPositionPatient = info.ImagePositionPatient;
imageOriantationPatient = info.ImageOrientationPatient;
% Read image
I = dicomread(info);
s = size(I);
%R = imref2d(s);
%[xIntrinsic,yIntrinsic,zIntrinsic] = worldToIntrinsic(R,83,85,93);
%disp(xIntrinsic);
%disp(yIntrinsic);
%disp(zIntrinsic);
%Display with scale rule
imagesc(I);
%make image read in gray scale
colormap(gray)
%imshow(I,'DisplayRange',[])
%% fourier
%dicFourired = fft2(I);
%imagesc(dicFourired);
%imshow(log(abs(dicFourired)),[-1 5]); 
%F2 = log(abs(dicFourired));
%imshow(F2,[-1 5],'InitialMagnification','fit');
%imshow(abs(dicFourired));
%dicComponents = bwconncomp(dicFourired);
%fourier = imread('fourierfram1.png',BG);
%imshow(fournier);






