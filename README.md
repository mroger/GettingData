# Processing Human Activity Recognition
This repository has the submission for the Programming Assignment of the Coursera's Getting and Cleaning Data course.
This README file explains the content of this repository and how data sets were processed.

## Files included in this repository
* **README.md**: This file  
* **CodeBook.md**: Describes the variables, the data, and transformations performed to clean up the data  
* **run_analysis.R**: It's the script that get the data from a remote location and performs the transformations required to generate the data as stated in the assignment.  
* **tidy_data_set.txt**: This file was the result of running the script **run_analysis.R**

## Data source
* #### The HAR data was obtained from the following location:  
##### [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

* #### The research is fully explained in the site:  
#####[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Execution of the script *run_analysis.R*
1. Before executing the script, please set a clean working directory with the *setwd()*  command, where the remote data will be downloaded and unzipped and the folder *data* and file *tidy_data_set.txt* will be generated.  
  
2. In a shell terminal, clone my git repository to this folder using the command:  
`git clone https://github.com/mroger/GettingData.git`  
  
3. Execute the **run_analysis.R** with the command given below:  
`source("run_analysis.R")`  
  
4. Load and view the tidy data set using the commands:  
`data <- read.table("./data/tidy_data_set.txt", header = TRUE)`  
`View(data)`
  

## run_analysis.R script execution

* ### Get the files to work  
Creates a data folder in the working directory and downloads the zip file into it, if not already there. Then unzip the files in the data folder.

* ### Read all data sets
#### The script then reads the following files into variables:   
activity_labels <- activity_labels.txt  
features <- features.txt  
x_train <- train/X_train.txt  
y_train <- train/y_train.txt  
subject_train <- train/subject_train.txt  
x_test <- test/X_test.txt  
y_test <- test/y_test.txt  
subject_test <- test/subject_test.txt

* ### Prepare the data sets before start binding
#### Using activity_labels data set, substitue ids in y_train and y_test by the description names.
#### Using features data set, rename x_train and x_test variable names  
#### Label x_train and x_test data set variables using features data set.  

* ### Bind train and test data sets by their columns
* #### Bind *y_train* and *x_train* by the columns
Bind y_train and x_train by the columns and save it in the yx_train data set. Leave x_train as the last columns so it's easy to find the activities.  

* #### Bind yx_train and subject_train by the columns
Bind yx_train and subject_train by the columns and save it in the train data set. Leave yx_train as the last columns so it's easy to find the subjects.  

* #### Bind *y_test* and *x_test* by the columns
Bind y_test and x_test by the columns and save it in the yx_test data set. Leave x_test as the last columns so it's easy to find the activities.  

* #### Bind *yx_test* and *subject_test* by the columns
Bind yx_test and subject_test by the columns and save it in the test data set. Leave yx_test as the last columns so it's easy to find the subjects.  

* ### Bind train and test data sets by their rows
#### Now, bind *train* and *test* data sets
Bind train and test data sets by its rows so we have all data set in one data set and save it in the human_activity data set.  

* ### Extracts only the measurements on the mean and standard deviation for each measurement.
#### Using regex, select columns from human_activity data set
Select columns **activity**, **subject** and columns that have **mean()** or **std()** in their names and save it back to human_activity data set.  

* ### Creates a tidy data set with the average of each variable for each activity and each subject

* #### Generate aggregate data set with average values  
Generate aggregate data set calculating the mean of every value by activity and data set. This is the wide form of tidy data set as discussed in [this site](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/).  

* #### Rename variable names to keep it tidy
Append "avg." in front of every column name, except for the activity and subject ones.  
Replace "-mean()" and "-std()" by "Mean" and "Std" names respectively.  
Replace remaining "-" by empty string ("").  

* #### Write the tidy data set to file
Write the tidy data set to a file called *tidy_data_set.txt* in the data folder.  



