function getPixelValues ()
    % Function to get the pixel values in an image.
    % The result will be written in a text file

    [filename, pathfile] = uigetfile('*');
    B = imread([pathfile filesep filename]);
    shortName = filename(1:end-4);
    fileID = fopen([pathfile filesep shortName '.txt'],'w');
    
    channels = '';
    for i = 1:size(B,3)
        channels = strcat(channels,strcat(strcat('Channel',num2str(i)),','));
    end
    
    fprintf(fileID,strcat('row,col,',channels));
    fprintf(fileID,'\n');
    
    for j = 1:size(B,2)
        for i = 1:size(B,1)
            if (~isequal(squeeze(B(i,j,:))',zeros(1,size(B,3))))
                fprintf(fileID, strcat(num2str(i),',',num2str(j),','));
                fprintf(fileID,'%.0f,',B(i,j,:));
                fprintf(fileID,'\n');
        end
    end           
            
end