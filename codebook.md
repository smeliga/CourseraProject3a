## Codebook: Assignment for week 3 of Getting and Cleaning Data Course
***
### Stefano Meliga
***

### Introduction
This codebook explains the variables of dataset produced by run_analysis.R, i.e. the output dataset "subj_act_mean_data" and its corresponding file output "tidy mean dataset.txt"

More information about the input dataset is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

More information about the script is provided in README.md

### Output dataset
The output dataset "subj_act_mean_data" and its corresponding file output "tidy mean dataset.txt" contain a dataset that merges and summarises the Human Activity Recognition Using Smartphones Data Set as described in README.md.
Specifically, the dataset contains the following information (by column):

* 1. subject id: the subject who performed the test (1-30)
* 2. Activity: whether the test activity was WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
* 3--68. mean signal measures for each subject and activity. The signals are the following:
    + tBodyAcc-XYZ
    + tGravityAcc-XYZ
    + tBodyAccJerk-XYZ
    + tBodyGyro-XYZ
    + tBodyGyroJerk-XYZ
    + tBodyAccMag
    + tGravityAccMag
    + tBodyAccJerkMag
    + tBodyGyroMag
    + tBodyGyroJerkMag
    + fBodyAcc-XYZ
    + fBodyAccJerk-XYZ
    + fBodyGyro-XYZ
    + fBodyAccMag
    + fBodyAccJerkMag
    + fBodyGyroMag
    + fBodyGyroJerkMag
    
    The set of variables that is reported for these signals are:
    + mean(): Mean value
    + std(): Standard deviation
    
    Prefix 't' indicates time domain, 'f'  indicate frequency domain signals. Features are normalized and bounded within [-1,1]. Further information is reported in features_info.txt and an exhaustive list of variable is reported in features.txt available from the original dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#### Notes: 
For more information contact: smeliga@gmail.com

#### License:
No responsibility implied or explicit can be addressed to the authors or their institutions for use or misuse of this dataset. Any commercial use is prohibited.

Stefano Meliga, July 2015.

