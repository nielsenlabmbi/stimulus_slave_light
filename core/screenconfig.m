function screenconfig

global screenPTR  screenNum Mstate Gtxtr Masktxtr 



screenNum=0;


PsychImaging('PrepareConfiguration');
PsychImaging('AddTask','General','FloatingPoint32BitIfPossible');
PsychImaging('AddTask','General','NormalizedHighresColorRange',1);
PsychImaging('AddTask', 'General', 'UseFastOffscreenWindows');

AssertOpenGL;
InitializeMatlabOpenGL;



screenRes = Screen('Resolution',screenNum);

%initialize pointers to textures generated in makeTexture
Gtxtr=[]; 
Masktxtr=[];

[screenPTR,~] = PsychImaging('OpenWindow', screenNum, 0.5);
Screen(screenPTR,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


% screenPTROff=Screen('OpenOffscreenWindow',screenPTR,[],[],[],[],8);
% Screen(screenPTROff,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

updateMonitor

pixpercmX = screenRes.width/Mstate.screenXcm;
pixpercmY = screenRes.height/Mstate.screenYcm;

syncWX = round(pixpercmX*Mstate.syncSize); %syncSize is in cm to be independent of screen distance
syncWY = round(pixpercmY*Mstate.syncSize);

Mstate.refresh_rate = 1/Screen('GetFlipInterval', screenPTR);

%SyncLoc = [0 screenRes.height-syncWY syncWX-1 screenRes.height-1]';
SyncLoc = [0 0 syncWX-1 syncWY-1]';
SyncPiece = [0 0 syncWX-1 syncWY-1]';

%Set the screen
wsync = Screen(screenPTR, 'MakeTexture', zeros(syncWY,syncWX),[],[],2); % "low"

Screen('DrawTexture', screenPTR, wsync,SyncPiece,SyncLoc);
Screen(screenPTR, 'Flip');


