% This script runs parallel analyses for two datasets:
%   1. omega intraop data
%   2. RCS postop data 
% 
% Analyses run in main:
%   1. timeseries
%   2. PACs
%
% maria.olaru@ucsf.edu
%
%% Omega intraop data
% INITIALIZE

% Note: this table needs to be completed for RCS subject for code to run
sessiondata_dir = '~/google_drive/UCSF_Neuroscience/starr_lab/intrapostop/data/';
fileinfo_fp = append(sessiondata_dir, 'omega_fileinfo.csv');
renamelog_fp = append(sessiondata_dir, 'omega_filerename_log.csv'); %log file

% Pull file info
fileinfo = get_fileinfo('RCS09_07_biecogbilfp_rest', fileinfo_fp);

% Get omega data file path
omega_fp = append(string(fileinfo.filedir), ...
    string(fileinfo.filename), ...
    string(fileinfo.ext));

% Rename file
% Note: can be renamed either with fileinfo table, manually in parameter, 
%       or not at all if paramter is left empty
% Example: rename_file(omega_fp, renamelog_fp, string(fileinfo.filename_out));
[omega_fp_rn] = rename_file(omega_fp, renamelog_fp); %recommended

% Restructure data format
subcortlfp = restructure(omega_fp_rn, fileinfo); 

% PREPROCESS
% Resample data
subcortlfp = resample_wrap(subcortlfp, 1000);

% Rereference data
subcortlfp = rereference(subcortlfp, fileinfo);




%% RCS postop data