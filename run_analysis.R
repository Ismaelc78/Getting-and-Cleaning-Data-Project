# Libraries 
library(tidyverse)
library(dplyr)

# Read in X-train , y_train, and subject for the Train set. 
# txt = tab delimited text. 
# Use (..sep = "  ", ...) to separate the values into their own column. 

TrainX<-read.delim2("X_train.txt", header = FALSE, sep = "", dec = ",")
TrainY<-read.delim2("y_train.txt", header = FALSE, sep = "", dec = ",")
Subjects<-read.delim2("subject_train.txt", header = FALSE, sep = "", dec = ",")
Features <- read.delim2("features.txt", header = FALSE, sep = "", dec = ",")


# Now we need to make Features into the header. Used the 2nd col as col. names for TrainSet 
names(TrainX) <- Features$V2

# combine Subjects and TrainY df
ID <- cbind(Subjects, TrainY)

# Now we need to make Col Names for ID
names(ID) <- c("ID", "Activity")

# Now I can bind ID with the TrainSet
TrainSet <- cbind(ID, TrainX)

# ------------------- Same for Test Set

Subject <-read.delim2("subject_test.txt", header = FALSE, sep = "", dec = ",")
TestX <-read.delim2("X_test.txt", header = FALSE, sep = "", dec = ",")
TestY <-read.delim2("y_test.txt", header = FALSE, sep = "", dec = ",")

# combine Subject, TrainY, and TestY in that order. Same order as the Train Set.
TestSet <- cbind(Subject, TestY, TestX)

# Make the TestSet column names the same as the TrainSet for a smooth row bind. 
names(TestSet)<- names(TrainSet)
HumanActivity <- rbind(TrainSet, TestSet)

# Only keep variables that are MEAN and STD.
HAdf<- cbind(HumanActivity$ID, HumanActivity$Activity,HumanActivity[ , grepl( "mean" , names( HumanActivity ) ) ],HumanActivity[ , grepl( "std" , names( HumanActivity ) ) ] )
HAdf <- rename(HAdf, ID = 'HumanActivity$ID',Activity = 'HumanActivity$Activity' )

# Change the Activity numbers into their descriptions ( Walking, Laying, etc. )
HAdf$Activity <- ifelse(HumanActivity$Activity == 1, "WALKING",
                        ifelse(HumanActivity$Activity == 2,"Walking_Upstairs", 
                               ifelse(HumanActivity$Activity == 3, "Walking_Downstairs", 
                                      ifelse(HumanActivity$Activity == 4, "Sitting",
                                             ifelse(HumanActivity$Activity == 5, "Standing", "Laying")
                                      ))))

#Next we want to find the mean for each variable grouped by the ID and Activity 
#First, we need to make sure the df is in numeric form.

TidyDF<- as.data.frame(sapply(HAdf, as.numeric))

# Since the "HAan" is numeric, the $Activity is now NA. Will move the old column to the new df.
TidyDF$Activity <- HAdf$Activity

# Now we will find the mean for each variable grouped by the ID and Activity 
TidyDF <- TidyDF %>% group_by(ID, Activity) %>% summarise_all(funs(mean) )

# Our data is Tidy.
dim(TidyDF)
view(TidyDF)
