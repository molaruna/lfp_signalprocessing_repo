% Resamples data
%
% maria.olaru@ucsf.edu

function data = resample_wrap(data, fs_rs)

data.fs_rs = fs_rs;
data.signal_rs = resample(double(data.signal'), data.fs_rs, data.fs)';

end