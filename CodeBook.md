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



