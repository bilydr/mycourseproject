## Step 1 
#  Merges the training and the test sets to create one data set.

#     prepare training set in one data frame- import data,
#       add 'subject' and 'activity' variables
fileX <- "./UCI HAR Dataset/train/X_train.txt"
filey <- "./UCI HAR Dataset/train/y_train.txt"
filesbj <- "./UCI HAR Dataset/train/subject_train.txt"

dt <- read.table(fileX)
activityID <- read.table(filey)
subjectID <- read.table(filesbj)
dttrain <- cbind(activityID, subjectID, dt)


#     prepare test set in one data frame- import data, 
#       add 'subject' and 'activity' variables
fileX <- "./UCI HAR Dataset/test/X_test.txt"
filey <- "./UCI HAR Dataset/test/y_test.txt"
filesbj <- "./UCI HAR Dataset/test/subject_test.txt"

dt <- read.table(fileX)
activityID <- read.table(filey)
subjectID <- read.table(filesbj)
dttest <- cbind(activityID, subjectID, dt)


#     combine training and test into one data frame

dtall <-rbind(dttrain, dttest)
rm(dt, dttest, dttrain, activityID, subjectID)

## Step 2 
#  Extracts only the measurements on the mean and standard deviation for each measurement. 
# read in variable and filter out those containing mean() and std()
feature <- read.table("./UCI HAR Dataset/features.txt")
colnames <- as.character(feature$V2)
colnames <- append(c("activityID", "subjectID"), colnames)
keep <- grepl("mean()", colnames, fixed=T) | grepl("std()", colnames, fixed=T)
keep [1:2] = T
# add the feature names as colnames for extracted data
dtextract <-dtall[keep]
names(dtextract) <- colnames[keep]
rm(dtall)


## Step 3 
#  Uses descriptive activity names to name the activities in the data set
actlbl <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names =c("activityID", "activity"))
dtextract <- merge(actlbl, dtextract, by ="activityID")



## Step 4 
#  Appropriately labels the data set with descriptive variable names. 
names(dtextract) <- gsub("\\(|\\)", "", names(dtextract))


## Step 5
#  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

lstact <- dtextract[,2]
lstsub <- dtextract[,3]

dtaverage <- aggregate(dtextract[, -c(1:3)], by=list(Activity = lstact, Subject = lstsub), mean)
write.table(dtaverage, file = "./avgdata.txt", row.name=FALSE, sep="\t")
