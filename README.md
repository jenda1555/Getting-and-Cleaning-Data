# Getting and Cleaning Data

## Course Project
There is one R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Writes tidy data to a txt file.

## Before running the R script
1. Install packages "data.table" and "reshape2".
2. Download the data source.
3. Put run_analysis.R in folder with data and set this folder as your working directory.
4. source("run_analysis.R") and you will get tidy_data.txt.
