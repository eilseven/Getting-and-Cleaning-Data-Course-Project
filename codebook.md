# Getting-and-Cleaning-Data-Course-Project
course taken on June 2015

## Description of Variables
fileUrl: URL that includes the required data.

fileDest: Assigned name of the the downloaded zip file.

main_dir: main directory containing the extracted file.

activity_labels_dir: "activity_labels" file directory

features_dir: "features" file directory

x_test_dir: "X_test" file directory

y_test_dir: "y_test" file directory

subject_test_dir: "subject_test" file directory

x_train_dir: "X_train" file directory

y_train_dir: "y_train" file directory

subject_train_dir: "subject_train" file directory

activity_labels: "activity_labels" data

features: "features" data

x_test: "X_test" data

y_test: "y_test" data

subject_test: "subject_test" data

x_train: "X_train" data

y_train: "y_train" data

subject_train: "subject_train" data

dataX: x_train and x_test row binded data

dataY: y_train and y_test row binded data

dataSubject: subject_train and subject_test row binded data

data: column binded data frame including dataX, dataY, dataSubject

mean_std: logical vector that is used to extract mean and standard deviation measurements

extracted: the name of data frame satisfying mean_std condition

tidyData: the resulting data frame that is extracted to the file "tidyData.txt"
