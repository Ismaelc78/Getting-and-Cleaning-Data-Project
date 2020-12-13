# Getting-and-Cleaning-Data-Project
**The purpose of the project was to practice my data tidying skills.**

This data used contains gravitational movement measurements performed on various people using smartphone accelerometers. It was used to advance research in wearable computing. 

Gathered .txt files from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

There was a Test and a Train folder with separate files that all had to be merged accordingly. 
For the variables/columns, it contained 560 quantitative measures, an ID for the subjects, and the Activity performed.
It also contained 10,299 observations.

**My goals were:**

1.	To gather the data using R.
2.	Explore the data and README.
3.	Find out how to merge it accordingly.
4.	Extracts only the measurements on the mean and standard deviation for each measurement.
5.	Uses descriptive activity names to label the activities in the data set. (Walking, Laying, etc.)
6.	Appropriately labels the data set with descriptive variable names.
7.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

**library(tidyverse)** was used to accomplish the assignment.

