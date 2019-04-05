function Mlist = moduleListSlave

%list of all modules on the slave
%organization: module code (for communication with the master), parameter
%file name, maketexture file name, playtexture file name
%the first one is the module that is automatically loaded when starting
%stimulator
%in contrast to the master, this list contains both the modules used by
%paramSelect and the manualMapper
%for the manualMapper, the makeTexture file and config file are not used
%ordering of modules here is independent of ordering of modules on master
%(identification is via the code)
%similarly, the blanks only have the playTexture file. blank file is listed here
%so that all make/play/config files are listed in the same place. blank
%should always be the last entry in Mlist

Mlist{1} = {'PG' 'configPstate_PerGrating' 'makeTexture_PerGrating' 'playTexture_PerGrating' };
Mlist{end+1} = {'RD' 'configPstate_RDK' 'makeTexture_RDK' 'playTexture_RDK' };
Mlist{end+1} = {'RG' 'configPstate_RCGrating' 'makeTexture_RCGrating' 'playTexture_RCGrating' };
Mlist{end+1} = {'OF' 'configPstate_OpticFlow' 'makeTexture_OpticFlow' 'playTexture_OpticFlow' };
Mlist{end+1} = {'IM' 'configPstate_Img' 'makeTexture_Img' 'playTexture_Img' };
Mlist{end+1} = {'PC' 'configPstate_PerGratingColor' 'makeTexture_PerGratingColor' 'playTexture_PerGratingColor' };
Mlist{end+1} = {'BR' 'configPstate_Bar' 'makeTexture_Bar' 'playTexture_Bar' };
Mlist{end+1} = {'BK' 'configPstate_Kalatsky' 'makeTexture_Kalatsky' 'playTexture_Kalatsky' };
Mlist{end+1} = {'CK' 'configPstate_CheckerBoard' 'makeTexture_CheckerBoard' 'playTexture_CheckerBoard' };
Mlist{end+1} = {'WG' 'configPstate_WarpedGrating' 'makeTexture_WarpedGrating' 'playTexture_WarpedGrating' };
Mlist{end+1} = {'WC' 'configPstate_WarpedChecker' 'makeTexture_WarpedChecker' 'playTexture_WarpedChecker' };


%playfile for the manual mapper
Mlist{end+1} = {'MG' '' '' 'playTexture_PerGratingManual'};
Mlist{end+1} = {'MM' '' '' 'playTexture_Mapper'};
Mlist{end+1} = {'MR' '' '' 'playTexture_RDKManual'};
Mlist{end+1} = {'MI' '' '' 'playTexture_ImgManual'};
Mlist{end+1} = {'MP' '' '' 'playTexture_PacmanManual'};
Mlist{end+1} = {'MC' '' '' 'playTexture_PiecewiseManual'};


%playfile for blanks
Mlist{end+1} = {'' '' '' 'playTexture_Blank'};


