%% first mouse
%video = "E:\Dropbox\Odense\Research\Scotinomys teguina USV 2019\Data\S. teguina\Analysis exp1\02_Adduction\ST045#005\190501_045_.avi";
%video = "E:\Dropbox\Odense\Research\Scotinomys teguina USV 2019\Data\S. teguina\Analysis exp1\02_Adduction\ST045#006\190501_045_.avi";
video = "E:\Dropbox\Odense\Research\Scotinomys teguina USV 2019\Data\S. teguina\Analysis exp1\02_Adduction\ST045#007\190501_045_.avi";
parts = regexp(video, '\', 'split');
name = parts(end-1);
[path, ~,~] = fileparts(video);

VidObj = VideoReader(video);
endframe=VidObj.NumFrames;
RotAng = -10.01;
FrameRate = 250;


WriteVidObj = VideoWriter(fullfile(path,strcat(name, "_rotated", ".avi")),'Uncompressed AVI');       
open(WriteVidObj);

for j=1:1:endframe  % Start and END frame
    Frame = read(VidObj,j);
    Frame_rot=(imrotate(Frame,RotAng)); % Make new crop NaN values by first offsetting and later subtracting
    
    % add lines
%     LineSpacing = round(size(Frame_rot,2)/40);
%     LinePos= LineSpacing:LineSpacing:size(Frame_rot,1);
%     Frame_rot(1:2:end,LinePos)=0; % color 
%     Frame_rot(LinePos,1:2:end)=0;
    
    figure(1)
    cla
    imagesc(Frame_rot)
    
    drawnow
%     pause
    clc
    j
    writeVideo(WriteVidObj,Frame_rot);


end
close(WriteVidObj)