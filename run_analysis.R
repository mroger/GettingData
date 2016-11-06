library(dplyr)

##1. Get the files to work
#-------------------------------------------------------------------------------#

print("Get the files to work")

#Create directory if does not exist
if (!file.exists("./data")) {
  dir.create("./data")
}

#Check if the data were already downloaded
if (!file.exists("./data/har_dataset.zip")) {
  #Download the zip file
  zipFile<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zipFile, destfile="./data/har_dataset.zip")
}
#Unzip the file in data folder
print("Unzip the file in data folder")
unzip(zipfile="./data/har_dataset.zip", exdir="./data")

##Read all data sets
#-------------------------------------------------------------------------------#

print("Read all data sets")

#activity_labels has 6 obs of 2 variables
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", colClasses = "character")

#features has 561 obs and 2 variables
features <- read.table("./data/UCI HAR Dataset/features.txt")

#X_train has 7352 obs and 561 variables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", numerals = c("no.loss"))

#y_train has 7352 obs and 1 variable
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

#subject_train has 7352 obs and 1 variable
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#X_test has 2947 obs and 561 variables
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", numerals = c("no.loss"))

#y_test has 2947 obs and 1 variable
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

#subject_test has 2947 obs and 1 variable
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##Start the transformations to create only one data set
#--------------------------------------------------------------------------------#

print("Start the transformations to create only one data set")

#Label y_train activities
#------------------------

#Label the activity_labels data set
names(activity_labels) <- c("id", "label")

#Label the y_train data set with appropriate name
names(y_train) <- c("activity")

#Change activity ids in y_train by activity labels using
#activity_labels data set
y_train <- mutate(y_train, activity = activity_labels$label[activity])

#Label y_test acivities
#----------------------

#Label the y_test data set variables with appropriate name
names(y_test) <- c("activity")

#Change activity ids in y_test by activity labels using
#activity_labels data set
y_test <- mutate(y_test, activity = activity_labels$label[activity])

#Change x_train and x_test variable names using features data set
#----------------------------------------------------------------

#Label features data set with more descriptive names
names(features) <- c("id", "label")

#Label x_train data set variables using features data set
names(x_train) <- features$label

#Label x_test data set variables using features data set
names(x_test) <- features$label

#Bind x_train, y_train and subject_train
#---------------------------------------

#Label subject_train data set with more descriptive names
names(subject_train) <- c("subject")

#Bind y_train and x_train by the columns. Leave x_train as the last columns so 
#it's easy to find Activities
yx_train <- cbind(y_train, x_train)

#Bind yx_train and subject_train by the columns. Leave yx_train as the last
#columns so it's easy to find Subjects
train <- cbind(subject_train, yx_train)

#Bind x_test, y_test and subject_test
#------------------------------------

#Label subject_test data set with more descriptive names
names(subject_test) <- c("subject")

#Bind y_test and x_test by the columns. Leave x_test as the last columns so 
#it's easy to find Activities
yx_test <- cbind(y_test, x_test)

#Bind yx_test and subject_test by the columns. Leave yx_test as the last
#columns so it's easy to find Subjects
test <- cbind(subject_test, yx_test)

#Bind train and test data sets so we have only one data set
#----------------------------------------------------------

#Bind train and test data sets by its rows so we have all data set in one data set
human_activity <- rbind(train, test)

#Select only the measurements on the mean and standard deviation
#for each measurement
#---------------------------------------------------------------

#Creates a vector with the selected columns = TRUE
human_activity_names <- names(human_activity)
selected_variables <- (
  (regexpr("^activity", human_activity_names) != -1) | 
  (regexpr("^subject", human_activity_names) != -1) | 
  (regexpr("mean\\(\\)", human_activity_names) != -1) | 
  (regexpr("std\\(\\)", human_activity_names) != -1)
)
#Select the columns and create a narrow data set
human_activity <- human_activity[, selected_variables == TRUE]

##Generate tidy data set
#-------------------------------------------------------------------------------#

print("Generate tidy data set")

#Create a data set with the average of each variable for each activity and
#each subject.
tidy_data_set <- aggregate(. ~ activity + subject, data = human_activity, mean)

#Rename tidy_data_set variables so it get tidy
names(tidy_data_set)[c(3:dim(tidy_data_set)[2])] <- sub("(.)", "avg.\\1", names(tidy_data_set)[c(3:dim(tidy_data_set)[2])])
names(tidy_data_set) <- sub("-mean\\(\\)", "Mean", names(tidy_data_set))
names(tidy_data_set) <- sub("-std\\(\\)", "Std", names(tidy_data_set))
names(tidy_data_set) <- sub("-", "", names(tidy_data_set))

#Write the data set to a file
write.table(tidy_data_set, "./data/tidy_data_set.txt")
