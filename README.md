# Course3FinalProj

==================================================================
Human Activity Recognition Using Smartphones (Calculating Means) Dataset
Version 1.0
==================================================================
Kristi Patterson, September 2016
==================================================================

It is important to read the README.txt for the original datasets prior to reading this document, which is located in UCI HAR DATASET files.

The following dataset, meanData was collected from the following files, which can be found in the UCI HAR DATASET files:
-X_train.txt
-X_train.txt. 
-subject_train.txt
-subject_test.txt
-y_train.txt
-y_test.txt
-features.txt


The X_train.txt and X_train.txt files were merged together, followed by an extraction of only the variables which contained measures on the mean and standard deviation for each measurement, including several variables that contain data on mean frequency. 
All variables and activities have been given descriptive names, which can be found in the codebook.txt file.
The meanData data frame is grouped by subject, starting with 1 and ending with 30, and for each subject, the mean of the measurements for each variable per activity is listed. 


For each record it is provided:
======================================

- Subject identifier (a number in the set 1-30)
- Activity label 
- Mean of the measurements collected for each variable

The dataset includes the following files:
=========================================

- 'README.md'

- 'run_anaylsis.R' script

- 'codebook.md'

- 'meanData.txt' data set



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

