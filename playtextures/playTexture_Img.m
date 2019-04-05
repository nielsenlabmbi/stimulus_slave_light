function playTexture_Img

%play basic images (tifs)


global Mstate screenPTR screenNum loopTrial IDim

global Gtxtr daq  %Created in makeGratingTexture

global Stxtr %Created in makeSyncTexture

P = getParamStruct;

%get stimulus size
screenRes = Screen('Resolution',screenNum);
pixpercmX = screenRes.width/Mstate.screenXcm;
pixpercmY = screenRes.height/Mstate.screenYcm;

syncWX = round(pixpercmX*Mstate.syncSize);
syncWY = round(pixpercmY*Mstate.syncSize);

syncSrc = [0 0 syncWX-1 syncWY-1]';
syncDst = [0 0 syncWX-1 syncWY-1]';

xN=deg2pix(P.x_size,'round');
if P.keepaspectratio
    yN = round((xN*IDim(1))/IDim(2));
else 
    yN=deg2pix(P.y_size,'round');
end

if P.usenativesize
    stimDstT = [0 0 IDim(2)-1 IDim(1)-1];
else
    stimDstT = [0 0 xN-1 yN-1];
end

stimDst=CenterRectOnPoint(stimDstT,P.x_pos,P.y_pos);

if P.croptoscale
    stimSrc = stimDst;
else
    stimSrc=[0 0 IDim(2)-1 IDim(1)-1];
end

Npreframes = ceil(P.predelay*screenRes.hz);
Nstimframes = ceil(P.stim_time*screenRes.hz);
Npostframes = ceil(P.postdelay*screenRes.hz);
Nstimframes_perImage = floor(Nstimframes/length(Gtxtr));


Screen(screenPTR, 'FillRect', P.background)

if ~isempty(daq)
    DaqDOut(daq, 0, 0);
end

%%%Play predelay %%%%
Screen('DrawTexture', screenPTR, Stxtr(1),syncSrc,syncDst);
Screen(screenPTR, 'Flip');
if loopTrial ~= -1 && ~isempty(daq)
    digWord = 1;  %Make 1st bit high
    DaqDOut(daq, 0, digWord);
end
for i = 2:Npreframes
    Screen('DrawTexture', screenPTR, Stxtr(2),syncSrc,syncDst);
    Screen(screenPTR, 'Flip');
end

%%%%%Play whats in the buffer (the stimulus)%%%%%%%%%%
stimNr = 1;

Screen('DrawTexture', screenPTR, Gtxtr(stimNr), stimSrc, stimDst);
Screen('DrawTexture', screenPTR, Stxtr(1),syncSrc,syncDst);
Screen(screenPTR, 'Flip');
if loopTrial ~= -1 && ~isempty(daq)
    digWord = 3;  %toggle 2nd bit to signal stim on
    DaqDOut(daq, 0, digWord);
end
for i=2:Nstimframes
    if i/Nstimframes_perImage >= 1 && mod(i,Nstimframes_perImage) == 1 && stimNr < length(Gtxtr)
        stimNr = stimNr + 1;
    end

    Screen('DrawTexture', screenPTR, Gtxtr(stimNr), stimSrc,stimDst);
    Screen('DrawTexture', screenPTR, Stxtr(1),syncSrc,syncDst);
    Screen(screenPTR, 'Flip');
end


%%%Play postdelay %%%%
for i = 1:Npostframes-1
    Screen('DrawTexture', screenPTR, Stxtr(2),syncSrc,syncDst);
    Screen(screenPTR, 'Flip');
    if i==1 && loopTrial ~= -1 && ~isempty(daq)
        digWord = 1;  %toggle 2nd bit to signal stim off
        DaqDOut(daq, 0, digWord);
    end
end
Screen('DrawTexture', screenPTR, Stxtr(1),syncSrc,syncDst);
Screen(screenPTR, 'Flip');
if loopTrial ~= -1 && ~isempty(daq)
    DaqDOut(daq, 0, 0);  %Make sure 3rd bit finishes low
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('DrawTexture', screenPTR, Stxtr(2),syncSrc,syncDst);  
Screen(screenPTR, 'Flip');

