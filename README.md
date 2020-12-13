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

    **library(tidyverse)** was used.
    

**To reach the goals in the project I did the following:**

The use of **read.delim2("X_train.txt", header = FALSE, sep = "", dec = ",")** to read in text files and separate the values appropriately. 

From exploring the data, I noticed the column names were in another txt.file as a column, so I had to reshape them as the names for the dataset.
I used **names(TrainX) <- Features$V2** to appropriately name the headers/values for the DF. 


I applied  **grepl()**  to produce variables that contained the characters "mean" or "std" . 
**HAdf<- cbind(HumanActivity$ID, HumanActivity$Activity,HumanActivity[ , grepl( "mean" , names( HumanActivity ) ) ],HumanActivity[ , grepl( "std" , names( HumanActivity ) ) ] )**

Then I nested **ifelse()** statements to turn the activity values to their corresponding activities (1== Walking, 6 == Laying, etc.)

The most challenging aspect was meeting goal #7. Where I had to produce the average of each variable for each activity AND each subject. I wasn't sure how to group by 2 different variables at the same time. Eventually I found out how to do it by using the **group_by()** and **summarise_all()** functions. 

Example:

**TidyDF <- TidyDF %>% group_by(ID, Activity) %>% summarise_all(funs(mean) )**

In the end, I took a while but learned a few things:

1.	Cleaning and exploring data.
2.	Reshape and reformat for better merging.
3.	Filter, sort, and order by certain criteria. 
4.	Tidy data into a nice legible format. 


