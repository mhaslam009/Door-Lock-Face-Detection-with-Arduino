clc;close;clear
c=webcam;
load myNet1;
faceDetector=vision.CascadeObjectDetector;
while true
    e=c.snapshot;
    bboxes =step(faceDetector,e);
    if(sum(sum(bboxes))~=0)
     es=imcrop(e,bboxes(1,:));
    es=imresize(es,[227 227]);
    label=classify(myNet1,es);
    image(e);
    title(char(label));
    drawnow;
    % create an arduino object

a = arduino('com4', 'uno');     

% start the loop to blink led for 10 seconds


for i = 1:1

    writeDigitalPin(a, 'D11', 1);

    pause(5);

    writeDigitalPin(a, 'D11', 0);

    pause(5);

end

% end communication with arduino

clear a

    else
        image(e);
        title('No Face Detected');
    end
end