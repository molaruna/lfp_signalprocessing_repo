% Outputs bilaterality and datatype features from filename
% Inputs
%   fp_fey: input file for analysis
%   table_in: table with omega fileinfo
%
% Output: struct object with features
% maria.olaru@ucsf.edu

function omega_info = get_fileinfo(filename, table_in)
table = readtable(table_in);

indx_match = find(strcmp(table.filename, filename));

omega_info = table(indx_match, :);

end