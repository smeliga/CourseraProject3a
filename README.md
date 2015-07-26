## Script: Assignment for week 3 of Getting and Cleaning Data Course
***
### Stefano Meliga
***

#### Required libraries:
reshape2


#### Description and input

The script run_analyis.R loads, cleans and summarises the Human Activity Recognition Using Smartphones Data Set:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Output

run_analyis.R creates a dataframe "subj_act_mean_data" that is written to file "tidy mean dataset.txt" which contains mean measurements by subject and activity. Only mean and std variable were selected.

More information about the datasets, variables and measures is reported in "codebook.md".


#### Function

Specifically, run_analyis.R performs the following operations:

1. load the datasets:
    + dimension labels (feature vector and activity labels)
    + loads train and test datasets which are composed of:
        + measures
        + subject id
        + activity id   
2. creates tidy dataframes with descriptive variables and activity names for both train and test datasets;
3. merges train and test datasets;
4. selects only mean and std measures (this is performed by grepping variables containing "mean()" and "std()" in their labels; other variables containing "mean" in their description were ignored in this instance)
5. calculates subject and activity means using the reshape2 library
6. write tidy mean dataset (subj_act_mean_data) to file "tidy mean dataset.txt"

#### Notes: 
For more information about this script contact: smeliga@gmail.com

#### License:
Use of this script in publications must be acknowledged by referencing the following Github repo: https://github.com/smeliga/CourseraProject3

No responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Stefano Meliga, July 2015.
