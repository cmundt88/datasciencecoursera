## check to see if file already exists and skip download if already there
## if not there, download, and unzip
library(dplyr)

if (!file.exists("data")) {
    dir.create("data")
}

if (!file.exists("./data/HAR.zip")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileUrl, destfile = "./data/HAR.zip", mode = 'wb')
}

if (!file.exists("./data/UCI HAR Dataset")) {
    unzip("./data/HAR.zip", exdir = "./data")
}

# read all relevant files into tables
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# combine observations
X_merge <- rbind(X_test, X_train)

# combine activity codes
y_merge <- rbind(y_test, y_train)

# combine subject codes
subject_merge <- rbind(subject_test, subject_train)

# add descriptive column names to observations
colnames(X_merge) <- features$V2

# subset the observations for only means and standard devs
X_merge <- X_merge[, grepl(("mean|std"), ignore.case = TRUE, colnames(X_merge))]

# add the activity codes to the observations
Xy_merge <- cbind(y_merge, X_merge)

# add the subject data
mergedData <- cbind(subject_merge, Xy_merge)
names(mergedData)[1] <- "Subject"

# add more meaningful activity labels that correspond to the activity codes
mergedData <- merge(activity_labels, mergedData, by.x = "V1", 
                    by.y = "V1")

names(mergedData)[2] <- "Activity"

# drop the activity code as it's no longer needed
mergedData$V1 <- NULL

tidyData <- group_by(mergedData, Subject, Activity)
tidyData <- summarise_each(tidyData, funs(mean))

write.table(tidyData, "wearables_tidydata.txt", row.name = FALSE)
