% Function that load all DICOM as 1 3D image
function dic3D = read3Ddicom()
    % firts we want to load path of files in the directory
    path = 'C:\Users\Kilany\Desktop\RS\DICOM\export0';
    format = '.dcm';
    tens = '00';
    hundreds = '0';
    framNo = '0';
    % make loop on number of frames
    for i=1:304
        % get current name of fram
        curr = int2str(i);
        if i < 10
            framNo = strcat(tens,curr);
        elseif (i < 100)&&(i >= 10)
            framNo = strcat(hundreds,curr);
        else 
            framNo = curr;
        end % if fram number
        %Get Current fram Path
        framPath = strcat(path , framNo , format ) ;
        %disp(framPath);
        %--------------------------
        % % NOW Read DICOM % %
        %--------------------------
        info = dicominfo(framPath);
        dic3D(:,:,i)= dicomread(info);
        disp(i);
    end % loop of frams
    disp('done sucessfuly');
    % Display the image
    %imagesc(dic3D(:,:,5));
    %make image read in gray scale
    %colormap(gray)
    % write image as dicom 3D
    % NOT Working !!!!!!!!!!!!!!!!!!!!
    %dicomwrite(dic3D, 'dic3D00',info);
end