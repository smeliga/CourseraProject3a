# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("~/Documents/Coursera/3 GettingCleaningData/Assignment")

#LOAD DIMENSION LABELS
#feature vector = col names
feature_path <- file.path("UCI HAR Dataset","features.txt")
feature_v <- read.table(feature_path)
#activity labels = 1 -> WALKING etc...
activity_labels_path <- file.path("UCI HAR Dataset","activity_labels.txt")
activity_labels <- read.table(activity_labels_path)

#LOAD TRAIN SET
#train measures
X_train_path <- file.path("UCI HAR Dataset","train","X_train.txt")
train_meas <- read.table(X_train_path)
#activity id
y_train_path <- file.path("UCI HAR Dataset","train","y_train.txt")
train_activity_id <- read.table(y_train_path)
#subject id
train_subject_path <- file.path("UCI HAR Dataset","train","subject_train.txt")
train_subject <- read.table(train_subject_path)

#LOAD TEST SET
#train measures
X_test_path <- file.path("UCI HAR Dataset","test","X_test.txt")
test_meas <- read.table(X_test_path)
#activity id
y_test_path <- file.path("UCI HAR Dataset","test","y_test.txt")
test_activity_id <- read.table(y_test_path)
#subject id
test_subject_path <- file.path("UCI HAR Dataset","test","subject_test.txt")
test_subject <- read.table(test_subject_path)

#PREP TRAIN DATASETS
# column names
names(train_meas) <- feature_v[,2]
# activity labels
train_activity <- sapply(train_activity_id$V1, function(x){activity_labels[x,2]})
train_activity <- factor(train_activity,levels=activity_labels$V2)
# build train dataframe
train_set <- data.frame(subject=train_subject[,1], activity=train_activity)
train_set[3:653] <- train_meas

# PREP TEST DATASET
# column names
names(test_meas) <- feature_v[,2]
# activity labels
test_activity <- sapply(test_activity_id$V1, function(x){activity_labels[x,2]})
test_activity <- factor(test_activity,levels=activity_labels$V2)
# build test dataframe
test_set <- data.frame(subject=test_subject[,1], activity=test_activity)
test_set[3:653] <- test_meas

#MERGE DATASETS
merged_data <- merge(train_set,test_set,all=TRUE)

#select only mean() and std() measures
mean_features <- grep("mean\\(\\)",feature_v[,2],ignore.case = TRUE)
std_features <- grep("std\\(\\)",feature_v[,2], ignore.case = TRUE)
mean_std_features <- sort(unique(c(mean_features,std_features)))
mean_std_data <- merged_data[,c(1,2,mean_std_features+2)]

#calculate subject and activity means
library(reshape2)
data_melt <- melt(mean_std_data, id=c("subject","activity"),
                  measure.vars=names(mean_std_data)[3:length(names(mean_std_data))])
subj_act_mean_data <- dcast(data_melt, subject + activity ~ variable, mean)

#write subj_act_mean_data to file
write.table(subj_act_mean_data, file = "tidy mean dataset.txt", row.name=FALSE)