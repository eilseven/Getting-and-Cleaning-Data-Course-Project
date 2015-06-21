#Getting and Cleaning Data Course Project
#You should create one R script called run_analysis.R that does the following:
#1)Merges the training and the test sets to create one data set.
#2)Extracts only the measurements on the mean and standard deviation for each measurement. 
#3)Uses descriptive activity names to name the activities in the data set.
#4)Appropriately labels the data set with descriptive variable names. 
#5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Downloading the zip file and unzipping it
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileDest <- "data.zip"
download.file(fileUrl, fileDest, method="curl")
unzip(fileDest)

#Defining file directories and loading data
main_dir <- paste(getwd(), "/UCI HAR Dataset", sep="")
activity_labels_dir <- paste(main_dir, "/activity_labels.txt", sep="")
features_dir <- paste(main_dir, "/features.txt", sep="")
x_test_dir <- paste(main_dir, "/test/X_test.txt", sep="")
y_test_dir <- paste(main_dir, "/test/y_test.txt", sep="")
subject_test_dir <- paste(main_dir, "/test/subject_test.txt", sep="")
x_train_dir <- paste(main_dir, "/train/X_train.txt", sep="")
y_train_dir <- paste(main_dir, "/train/y_train.txt", sep="")
subject_train_dir <- paste(main_dir, "/train/subject_train.txt", sep="")

activity_labels <- read.table(activity_labels_dir)
features <- read.table(features_dir)
x_test <- read.table(x_test_dir)
y_test <- read.table(y_test_dir)
subject_test <- read.table(subject_test_dir)
x_train <- read.table(x_train_dir)
y_train <- read.table(y_train_dir)
subject_train <- read.table(subject_train_dir)

#Step1: Merging training and test datasets
#Note that dataX contains "features", dataY contains "activity", dataSubject contains "subject"
dataX <- rbind(x_train, x_test)
colnames(dataX) <- features[, 2]
dataY <- rbind(y_train, y_test)
colnames(dataY) <- "activity"
dataSubject <- rbind(subject_train, subject_test)
colnames(dataSubject) <- "subject"
#Merging all datasets
data <- cbind(dataSubject, dataY, dataX)

#Step2: Extracting measurements on the mean and standard deviation for each measurement
mean_std <- grepl("(mean|std)\\()", colnames(data))
extracted <- data[ ,mean_std]

#Step3: Using descriptive activity names to name the activities in the data set
extracted$activity <- activity_labels[data$activity, 2]
extracted$subject <- data$subject

#Step4: Appropriately labeling the data set with descriptive variable names
colnames(extracted) <- gsub("^t", "time", colnames(extracted))
colnames(extracted) <- gsub("^f", "freq", colnames(extracted))
colnames(extracted) <- gsub("gravity", "Gravity", colnames(extracted))
colnames(extracted) <- gsub("[Bb]ody[Bb]ody", "Body", colnames(extracted))
colnames(extracted) <- gsub("-", ".", colnames(extracted))
colnames(extracted) <- gsub("[:(:][:):]", "", colnames(extracted))

#Step5: From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- ddply(extracted, c("activity", "subject"), numcolwise(mean))
write.table(tidyData, file="tidyData.txt", row.name=FALSE)

