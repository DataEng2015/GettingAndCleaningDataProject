# Code Book

This document describes the code inside `run_analysis.R`.

## The analysis consists of the following steps

* Create data folder in the working directory
* Download the source dataset
* unzip the source dataset zip file
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## Tidy Data Output
    Subject  Activity timeBodyAccelerometerMean-X timeBodyAccelerometerMean-Y timeBodyAccelerometerMean-Z
    1  WALKING        0.2773308       -0.01738382        -0.1111481
    2  WALKING        0.2764266       -0.01859492        -0.1055004
    3  WALKING        0.2755675       -0.01717678        -0.1126749
	
## Tidy Data Description
The tidy data set contains 180 observations with 81 variables divided in:
* an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* an identifier of the subject who carried out the experiment (<strong>Subject</strong>):
   1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
* a 79-feature vector with the mean of time and frequency domain signal variables  for each activity and each subject(numeric)




