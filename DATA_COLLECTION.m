clc
clear all
close all
warning off;
cao=webcam; %Turning on webcam
faceDetector=vision.CascadeObjectDetector; %a face is present usng viola jones algorithim
c=150; %it line hsows the number of images it takes
temp=0; %keeps track of images
while true
    e=cao.snapshot; %capture the images
    bboxes =step(faceDetector,e); %fcae detected
    if(sum(sum(bboxes))~=0) 
    if(temp>=c) %if temp>c no image will be captured
        break;
    else
    es=imcrop(e,bboxes(1,:)); %cropping the image part
    es=imresize(es,[227 227]); %resizing v.imp for alexnet transfer learning because alexnet req 227 across 227 image for trainig
    filename=strcat(num2str(temp),'.bmp'); %capturng images
    imwrite(es,filename);
    temp=temp+1;
    imshow(es);
    drawnow;
    end
    else %if temp has reached limit no image will be capturing
        imshow(e); 
        drawnow;
    end
end