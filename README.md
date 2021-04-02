# omegarcs_signalprocessing_standardization

This code uses the comodulogram algorithm to run identical PACs (power-amplitude coupling) analysis with lfp (local field potential) data collected (1) intraoperatively with the Omegatron and (2) post-operatively with the RC+S neural implant device. 

## Getting Started

This code uses Matlab 2019a. 

## Data

### Intraoperative data
These data are available on UCSF Box, [here](). You will first need to request access from me. Download Box Drive and add the files locally using the standard file directory structure (~/Box/) to implement this code.

### Session data
These data contain the parameters of the (1) file path information of the intraoperative data, (2) output file names, and (3) parameters from the data collection session. They are available on Google Drive, [here](). You will first need to request access from me. Upload the dataset into the **data** directory to implement this code. 

Note: This table needs to be completed for the specified filename row for the subject data to run. 

Column naming key:
"bilateral" 0 = NO, 1 = YES
"datatype" 4 = lfp

## Analysis + figures

All raw data are cleaned and figures are generated using ```omegarcs_main```. The outputs are in the **plots** directory. You can comment and uncomment the figures you want to run. 

## Notes

## License
This software is open source and under an MIT license. 

