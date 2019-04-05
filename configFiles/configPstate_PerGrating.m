function configPstate_PerGrating

%periodic grater

global Pstate

Pstate = struct; %clear it

Pstate.param{1} = {'predelay'  'float'      2       0                'sec'};
Pstate.param{2} = {'postdelay'  'float'     2       0                'sec'};
Pstate.param{3} = {'stim_time'  'float'     1       0                'sec'};

Pstate.param{4} = {'x_pos'       'int'      600       0                'pixels'};
Pstate.param{5} = {'y_pos'       'int'      400       0                'pixels'};
Pstate.param{6} = {'x_size'      'float'      3       1                'deg'};
Pstate.param{7} = {'y_size'      'float'      3       1                'deg'};
Pstate.param{8} = {'mask_type'   'string'   'none'       0                ''};
Pstate.param{9} = {'mask_radius' 'float'      6       1                'deg'};

Pstate.param{10} = {'contrast'    'float'     100       0                '%'};
Pstate.param{11} = {'ori'         'float'        0       0                'deg'};
Pstate.param{12} = {'phase'         'float'        0       0                'deg'};
Pstate.param{13} = {'s_freq'      'float'      1      -1                 'cyc/deg'};
Pstate.param{14} = {'s_profile'   'string'   'sin'       0                ''};
Pstate.param{15} = {'s_duty'      'float'   0.5       0                ''};
Pstate.param{16} = {'t_period'    'int'       20       0                'frames'};

Pstate.param{17} = {'plaid_bit'    'int'        0       0             'binary'};
Pstate.param{18} = {'surround_bit'    'int'        0       0             'binary'};

Pstate.param{19} = {'x_size2'      'float'      3       1                'deg'};
Pstate.param{20} = {'y_size2'      'float'      3       1                'deg'};
Pstate.param{21} = {'mask_type2'   'string'   'none'       0                ''};
Pstate.param{22} = {'mask_radius2' 'float'      6       1                'deg'};
Pstate.param{23} = {'contrast2'    'float'     10       0                '%'};
Pstate.param{24} = {'ori2'         'float'        90       0                'deg'};
Pstate.param{25} = {'phase2'         'float'        0       0                'deg'};
Pstate.param{26} = {'s_freq2'      'float'      1      -1                 'cyc/deg'};
Pstate.param{27} = {'s_profile2'   'string'   'sin'       0                ''};
Pstate.param{28} = {'s_duty2'      'float'   0.5       0                ''};
Pstate.param{29} = {'t_period2'    'int'       20       0                'frames'};

Pstate.param{30} = {'tmod_bit'    'int'       0       0                ''};
Pstate.param{31} = {'tmod_max'    'int'       100       0                '% contrast'};
Pstate.param{32} = {'tmod_min'    'int'       0       0                '% contrast'};
Pstate.param{33} = {'tmod_tperiod'    'int'       20       0                'frames'};
Pstate.param{34} = {'tmod_tprofile'    'string'      'sin'       0                ''};

Pstate.param{35} = {'background'    'float'   0.5       0                ''};





