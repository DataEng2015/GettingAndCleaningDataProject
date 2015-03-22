## Step 0a: download the data file
if(!file.exists("./data")){
  dir.create("./data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile="./data/UCI HAR Dataset.zip")
unzip("./data/UCI HAR Dataset.zip", exdir="./data" )

## Step 0b: load data sets
data_rpath <- "./data/UCI HAR Dataset"
activity_train <- read.table(file.path(data_rpath, "train/Y_train.txt"), header=FALSE)
subject_train <- read.table(file.path(data_rpath, "train/subject_train.txt"), header=FALSE)
features_train <- read.table(file.path(data_rpath, "train/X_train.txt"), header=FALSE)

##str(activity_train)
##str(subject_train)
##str(features_train)


activity_test <- read.table(file.path(data_rpath, "test/Y_test.txt"), header=FALSE)
subject_test <- read.table(file.path(data_rpath, "test/subject_test.txt"), header=FALSE)
features_test <- read.table(file.path(data_rpath, "test/X_test.txt"), header=FALSE)

##str(activity_test)
##str(subject_test)
##str(features_test)

## Step 1: Merges the training and the test sets to create one data set.
## name columns and combine the train datasets into one
names(subject_train) <- c("subject")
names(activity_train) <- c("activity")
FeaturesNames <- read.table(file.path(data_rpath, "features.txt"),head=FALSE)
names(features_train)<- FeaturesNames[,2]
train_data <- cbind(subject_train, cbind(activity_train, features_train))

names(subject_test) <- c("subject")
names(activity_test) <- c("activity")
names(features_test)<- FeaturesNames[,2]
test_data <- cbind(subject_test, cbind(activity_test, features_test))

data <- rbind(train_data, test_data) ## combined data frame

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
selectedFNames <- FeaturesNames[grepl("mean|std", FeaturesNames[,2]),2]
SelectedNames <- c("subject", "activity", as.character(selectedFNames))
data <- data[ , SelectedNames]

## Step 3: Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(file.path(data_rpath, "activity_labels.txt"),header = FALSE)
data <- merge(data, activity_labels, by.x = "activity", by.y = "V1")
data <- data[, -1]
names(data)[81] <- "activity"

##Step 4: Appropriately labels the data set with descriptive variable names.
names(data)<-gsub("Freq", "Frequency", names(data))
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("-mean", "Mean", names(data))
names(data)<-gsub("-std", "StandardDeviation", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("\\()", "", names(data))

##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average 
##  of each variable for each activity and each subject
library(plyr)
##data_mean_by_activity_subject <- ddply(data, c("activity", "subject"), numcolwise(mean))
data_mean_by_activity_subject<-aggregate(. ~subject + activity, data, mean)
write.table(data_mean_by_activity_subject, file = "./data/data_mean_by_activity_subject.txt",row.name=FALSE)
