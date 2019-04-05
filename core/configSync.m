function configSync

%configures the DAQ device used to generate TTL pulses

global daq  setupDefault


if setupDefault.useMCDaq==1
    
    daq = DaqDeviceIndex;
    
    if ~isempty(daq)
        
        %port 0 is used for stimulus related TTL pulses
        DaqDConfigPort(daq,0,0);
        
        DaqDOut(daq, 0, 0);
               
    else
        
        errordlg('Daq device does not appear to be connected');
        
    end
else
    daq=[];
end