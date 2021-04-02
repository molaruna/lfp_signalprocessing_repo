% The largest contact's signal on either hemisphere is not saved. 
% For the remaining contacts, on a hemisphereic level,
% contact x signal is subtracted by contact x+1 signal
%
% maria.olaru@ucsf.edu

function data = rereference(data, fileinfo)

data.test = fileinfo.bilateral;

end