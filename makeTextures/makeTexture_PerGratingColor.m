function makeTexture_PerGratingColor

%make periodic grating with color
%only generates one drifting grating, no plaid or surrounr
%this assumes a normalized color scale from 0 to 1 for each gun

global  screenPTR screenNum 

global Gtxtr  Masktxtr   %'play' will use these

%clean up
if ~isempty(Gtxtr)
    Screen('Close',Gtxtr);  %First clean up: Get rid of all textures/offscreen windows
end

if ~isempty(Masktxtr)
    Screen('Close',Masktxtr);  %First clean up: Get rid of all textures/offscreen windows
end

Gtxtr = [];  
Masktxtr=[];


%get parameters
P = getParamStruct;
screenRes = Screen('Resolution',screenNum);


%convert stimulus size to pixel
xN=deg2pix(P.x_size,'round');
yN=deg2pix(P.y_size,'round');


%create the masks 
mN=deg2pix(P.mask_radius,'round');
mask=makeMask(screenRes,P.x_pos,P.y_pos,xN,yN,mN,P.mask_type);

Masktxtr(1) = Screen(screenPTR, 'MakeTexture', mask,[],[],2);  %need to specify correct mode to allow for floating point numbers


%generate texture

%stimuli will need to be larger to deal with rotation
stimsize=2*sqrt((P.x_size/2).^2+(P.y_size/2).^2);

%add extra so that we can slide the window to generate motion 
stimsize=stimsize+1/P.s_freq;

%use ceil to make sure that we definitely have enough pixels
stimsizeN=deg2pix(stimsize,'ceil');


%generate  grating
x_ecc=linspace(-stimsize/2,stimsize/2,stimsizeN);
sdom = x_ecc*P.s_freq*2*pi; %radians
gratingTemp = cos(sdom);

if strcmp(P.s_profile,'square')
    thresh = cos(P.s_duty*pi);
    gratingTemp=sign(gratingTemp-thresh);
end



%grating is between -1 and 1; transform it to color1 to color2 for each
%channel
grating=zeros([size(gratingTemp) 3]);    

camp(1)=1/2*(P.c1_red-P.c2_red);
coff(1)=1/2*(P.c1_red+P.c2_red);

camp(2)=1/2*(P.c1_green-P.c2_green);
coff(2)=1/2*(P.c1_green+P.c2_green);

camp(3)=1/2*(P.c1_blue-P.c2_blue);
coff(3)=1/2*(P.c1_blue+P.c2_blue);
    
for i=1:3
    grating(:,:,i)=gratingTemp*camp(i)+coff(i);
end



Gtxtr(1) = Screen('MakeTexture',screenPTR, grating,[],[],2);








