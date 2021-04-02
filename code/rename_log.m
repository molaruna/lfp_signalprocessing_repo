% This function saves a log for the:
%   1. timestamp of conversion
%   2. original filename
%   3. renamed filename
%
% The key is saved as a CSV in google drive
% maria.olaru@ucsf.edu

function rename_log(log_fp, timestamp, fp_in, fp_out)

[dir_in, name_in] = fileparts(fp_in);
[dir_out, name_out] = fileparts(fp_out);

key_in = readtable(log_fp);
table_add = cell2table({timestamp, name_in, name_out}, 'VariableNames', ...
    {'timestamp', 'in', 'out'});

table_out = [key_in; table_add];

writetable(table_out, log_fp)
end