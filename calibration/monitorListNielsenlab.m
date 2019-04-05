function monitorPar = monitorListNielsenlab(monitorID)

%the long name is used on the master, the short ID on the slave

switch monitorID
   case {'Linear','LIN'} %just standard linear lookup table
        
        monitorPar.ID='LIN';
        monitorPar.Name='Linear';
        monitorPar.screenXcm = 54.5;
        monitorPar.screenYcm = 30;
        monitorPar.xpixels = 1920;
        monitorPar.ypixels = 1080;
        monitorPar.LUT='/home/nielsenlab/stimulator_slave/calibration/general/linearLut.mat';
    
    case {'Acer','LCD'} %60Hz acer
        
        monitorPar.ID='LCD'; 
        monitorPar.Name='Acer';
        monitorPar.screenXcm = 54.5;
        monitorPar.screenYcm = 30;
        monitorPar.xpixels = 1920;
        monitorPar.ypixels = 1080;
        monitorPar.LUT='/home/nielsenlab/stimulator_slave/calibration/Acer160617/luminance.mat';
                      
    case {'LG','LGL'} %large LG screen

        monitorPar.ID='LGL';
        monitorPar.Name='LG';
        monitorPar.screenXcm = 94.3;
        monitorPar.screenYcm = 53.4;
        monitorPar.xpixels = 1920;
        monitorPar.ypixels = 1080;
        monitorPar.LUT='/home/nielsenlab/stimulator_slave/calibration/LG43_161013/luminance.mat';
end
