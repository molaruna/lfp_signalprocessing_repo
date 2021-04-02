% Creates a copy of the file in the same folder with a different filename
% Saves and outputs the renamed filepath in a matrix
% Calls a function that adds entry to the renamed file log
%
% Inputs
%   fp_in: full filepath as character vector
%   file_out: must be EITHER empty or contain filename (no extension)
%       NOTE: this is optional. If empty, will not change input filename
%
% Outputs
%   fp_out: full filepath of renamed file
%   timestamp: datetime format using Pacific Time  
%
% maria.olaru@ucsf.edu

function fp_out = rename_file(fp_in, log_fp, name_out)

[dir_in, name_in, ext_in] = fileparts(fp_in);

if ~exist('name_out', 'var')
    fp_out = fp_in;
else
    fp_out = strjoin([dir_in, "/", name_out, ext_in], "");
    copyfile(fp_in, fp_out)
end

timestamp = datestr(now);

% Save renamed file in log
rename_log(log_fp, timestamp, fp_in, fp_out);
end