# Clean workspace
rm(list=ls())

# Set working directory
setwd(file.path("C:","Users","AJ","Desktop","eRreando","Coursera",
                "CleaningData","w3","project"))

dir(getwd())

# Read test and training data to merge. I'm not using the Inertial Signals,
# as stated in the forum thread David's project FAQ.

# Naming conventionsI'm going to use
# functions: lowerCamel
# parameters: period.separated
# variables: underscore_separated
# data set objects loaded: UpperCamel

XTrain <- read.csv("./UCI_HAR_Dataset/train/X_train.txt", sep="", header=FALSE)
dim(XTrain)
names(XTrain)

YTrain <- read.csv("./UCI_HAR_Dataset/train/Y_train.txt", sep="", header=FALSE)
dim(YTrain)
names(YTrain)[1] <- "activity"

SubjTrain <- read.csv("./UCI_HAR_Dataset/train/subject_train.txt", sep="", header=FALSE)
dim(SubjTrain)
names(SubjTrain)[1] <- "participant"

XTest <- read.csv("./UCI_HAR_Dataset/test/X_test.txt", sep="", header=FALSE)
dim(YTrain)

YTest <- read.csv("./UCI_HAR_Dataset/test/Y_test.txt", sep="", header=FALSE)
dim(YTest)
names(YTest)[1] <- "activity"

SubjTest <- read.csv("./UCI_HAR_Dataset/test/subject_test.txt", sep="", header=FALSE)
dim(SubjTest)
names(SubjTest)[1] <- "participant"

# Examine the structure of the separate data files.
unique(Ytrain)
unique(Ytest)
# Y train and Y test values can only correspond to Activity Label information, 
# as the levels 1-6 match the Activity Label values.
# SubjTest and SubjTrain have the ID numbers of each one of the 30 participants.
# We can check this using:
unique(SubjTest)
unique(SubjTrain)
# And because we are going to merge the data, we'd like to see better column names
# than 'V1', so we change the corresponding columns to 'activity' and 'participant'


# Read features list and activity labels

Features <- read.csv("./UCI_HAR_Dataset/features.txt", sep="", header=FALSE)
dim(Features)

ActivityLabels <- read.csv("./UCI_HAR_Dataset/activity_labels.txt", sep="", header=FALSE,
                           stringsAsFactors=FALSE)
dim(ActivityLabels)


## Assignment 1: Merge training and test sets to create a single data set

# First, we want to merge the training data files together as well as the the test data
# ones
TrainData <- cbind(SubjTrain, XTrain, YTrain)
dim(TrainData)
# 7352 rows and 563 columns

TestData <- cbind(SubjTest, XTest, YTest)
dim(TestData)
# 2947 rows and 563 columns

# Now, we want to merge the two sets, train and test data rows.

FullData <- rbind(TrainData, TestData)
dim(FullData)
names(FullData)

# Now, we'd like to name the variable names (that are not participant ID or activity)
# using Features information (numbered from V1 to V561)

# Convert second column (V2) from Features to a character vector
FeaturesVector <- as.vector(Features$V2)
# Now set FullData names (except participant [1] and activity [563] columns) according to the 
# FeaturesVector
head(FullData[1])
head(FullData[563])

names(FullData)[2:562] <- FeaturesVector

## Assignment 2: Extract only the variables that have something to do with the mean and
## the standard deviation for each measurement.

# We can try to do this by subsetting only the column names that contain 'mean' or 'sd' in
# them, but we do not want to leave outside our 'participant' and 'activity' variables,
# so we include them in the 'GoodVariableNames' search.

GoodVariableIndex <- grep(pattern="participant|activity|.*mean.*|.*std.*", names(FullData),
                      ignore.case=TRUE)

GoodData <- FullData[GoodVariableIndex]
names(GoodData)

## Assignment 3: Use real activity names to replace activity codes in the data set

class(ActivityLabels$V2)
class(GoodData$activity)
ActivityLabels
# Now we can see the numeric value for each activity label, so we can replace
# each value to its label.

GoodData$activity <- as.character(GoodData$activity)
GoodData$activity[GoodData$activity==1] <- "Walking"
GoodData$activity[GoodData$activity==2] <- "Walking Upstairs"
GoodData$activity[GoodData$activity==3] <- "Walking Downstairs"
GoodData$activity[GoodData$activity==4] <- "Sitting"
GoodData$activity[GoodData$activity==5] <- "Standing"
GoodData$activity[GoodData$activity==6] <- "Laying"


## Assignment 4: change column variable names to make them more descriptive
## The weirdest variable name parts were the 'Acc' , 'Gyro' and 'Mag, but they were
## only weird for me. I'm going to assume people who works with the dataset know
## the abreviations, so I'm not going to change them.
## I am going to replace t and f with 'time' and 'freq'
## I'm also removing the () because I think they only add characters to the variable name
## and last I'm going to transform all variable names to underscored_separated, because
## long character strings seem more clogged and difficult to read for me.

names(GoodData)

names(GoodData) <- gsub("^f", "freq_", names(GoodData), ignore.case=FALSE)
names(GoodData) <- gsub("^t", "time_", names(GoodData), ignore.case=FALSE)
names(GoodData) <- gsub("()", "", names(GoodData), fixed=TRUE)
names(GoodData) <- gsub("-", "_", names(GoodData))
names(GoodData) <- gsub("BodyBody", "Body", names(GoodData), fixed=TRUE, ignore.case=FALSE)
names(GoodData) <- gsub("Body", "Body_", names(GoodData), fixed=TRUE,)
names(GoodData) <- gsub("Gravity", "Gravity_", names(GoodData), ignore.case=TRUE)
names(GoodData) <- gsub("Acc", "Acc_", names(GoodData), fixed=TRUE)
names(GoodData) <- gsub("Gyro", "Gyro_", names(GoodData), fixed=TRUE)
names(GoodData) <- gsub("Jerk", "Jerk_", names(GoodData), fixed=TRUE)
names(GoodData) <- gsub("__", "_", names(GoodData), fixed=TRUE)
names(GoodData) <- tolower(names(GoodData))

## Assignment 5: create tidy data set with the average of each variable for
## each activity and subject.

AverageData <- aggregate(GoodData, by=list(blah1=GoodData$activity, 
                                           blah2=GoodData$participant), mean)

## I know this is dirty, but I could not think of anything else at the moment...
## >_<
AverageData[,"blah2"] <- NULL
AverageData[,"activity"]<- NULL
names(AverageData)[1] <- "activity"

# Now the tidy data set, I'm going to leave the data in its current long  format,
# following Hadley Wickham's http://vita.had.co.nz/papers/tidy-data.html.

write.table(AverageData, file="tidy_data_set.txt", sep=";", row.names=FALSE)
