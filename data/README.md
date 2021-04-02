# omega_fileinfo

This table contains the information necessary to link the data collection protocol with the hardware modules to correctly interpret the data. 

## Column naming key
**filedir**: full path of parent directory to the input file  
**filename**: file name of the input file  
**ext**: file extension (requirement: "." at the beginning of extension)  
**filename_out**: the filename of all subsequent output files (plots, etc)  
**bilateral**: 0 = unilaterally implanted subject; 1 = bilaterally implanted subject  
**aux_module**: either blank (NaN), or the module number (1-4)  
**ecog_module**: either blank (NaN), or the module number (1-4)  
**emg_module**: either blank (NaN), or the module number (1-4)  
**subcortlfp_module**: either blank (NaN), or the module number (1-4)  
