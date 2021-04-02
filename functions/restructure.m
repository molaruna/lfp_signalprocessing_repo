% Pulls sub-cort LFP signal and sampling rate from each contact
%
% Output: struct object with 4 fields (row numbers correspond to contacts)
%   signal - pulls signal data from each contact
%   fs - pulls fs data from contact 1
%   signal_var - variable names used to get signal data
%   fs_var - variable name used to get fs signal
%
% maria.olaru@ucsf.edu

function subcortlfp = restructure(fp_in, fileinfo)

input_obj = matfile(fp_in);

if fileinfo.bilateral == 1
    lead_num = 8; 
else
    lead_num = 4;
end   

% Reconstruct variable names of datatype from input MAT (omega) file
contact_vec = string(1:lead_num)';

mod_subcortlfp_vec = repelem(string(fileinfo.subcortlfp_module), lead_num)';


str1_vec = repmat({'CECOG_HF_'}, lead_num, 1);
str2_vec = repmat({'___0'}, lead_num, 1);
str3_vec = repmat({'___Array_'}, lead_num, 1);

if (fileinfo.subcortlfp_module == 2)
    str4_vec = repmat({'___'}, lead_num, 1);
elseif (fileinfo.subcortlfp_module ~= 2)
    str4_vec = repmat({'___0'}, lead_num, 1);
end

% subcort lfp vector of variable names for the signal of each contact
varname_subcortlfp_signal_vec = append(str1_vec, mod_subcortlfp_vec, ...
    str2_vec, contact_vec, ...
    str3_vec, mod_subcortlfp_vec, ...
    str4_vec, contact_vec);

varname_subcortlfp_fs = append(varname_subcortlfp_signal_vec(1), '_KHz');

% Initialize subcort lfp struct array
subcortlfp = struct('signal_var', varname_subcortlfp_signal_vec, ...
        'fs_var', varname_subcortlfp_fs, ...
        'fs', input_obj.(varname_subcortlfp_fs)*1000, ...
        'signal', []);

% Store data from variable names into lfp struct
% Note: for loop necessary because accessing MAT var names is not vectorized
filenames = subcortlfp.signal_var;
for i = 1:lead_num
    old_signal = subcortlfp.signal;
    new_signal = input_obj.(filenames(i));
    new_signal_arr = [old_signal; new_signal];
    subcortlfp.signal = new_signal_arr;
end
end