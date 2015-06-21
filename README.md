# Getting-and-Cleaning-Data-Course-Project
course taken on June 2015

## Project Description
Please See: https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions

Details: The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the ptoject: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

What should be done?:
An R script called run_analysis.R must be created, which does the following:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps and Explanations
Lines 10-13: Downloads the file and unzips it.
Downloaded zip file is named "data.zip".
This zip file is unzipped to the current directory.

Lines 16-33: Defines the file directories and loads data.
First, the directory names for the required files are created with the names ending with "_dir".
Then, using these directory names and read.table() function, the required files are read.

Lines 37-44: Step 1 - Merges training and test datasets.
x_train and x_test datasets are put to dataX. The columns are named according to the second column of features data.
y_train and y_test datasets are put to dataY. The column is named "activity".
subject_train and subject_test datasets are put to dataSubject. The column is named "subject".
All of the files is merged under the name "data".

Lines 47-48: Step 2 - Extracts the measurements on the mean and standard deviation.
Measurements including "mean()" or "std()" is extracted through grepl function.
The resulting extracted data is put to "extracted".

Lines 51-52: Step 3 - Uses descriptive activity names.
The new dataset "extracted" requires being "activity" and "subject" labels.

Lines 55-60: Step 4 - Labels the dataset appropriately.
Labels are renamed accordingly: 
"t" at the beginning of a line is renamed as "time"
"f" at the beginning of a line is renamed as "freq"
"gravity" is renamed as "Gravity"
"[Bb]ody[Bb]ody" is renamed as "Body"
"-" character is changed to "."
"()" characters is changed to ""

Lines 63-64: Step 5 - Creates the tidy dataset.
Tidy data is created under the name "tidyData" and can be found at "tidyData.txt"