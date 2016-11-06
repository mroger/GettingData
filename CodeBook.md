# CodeBook for tidy data set

## *tidy_data_set.txt* Variables
activity
subject
avg.tBodyAccMeanX
avg.tBodyAccMeanY
avg.tBodyAccMeanZ
avg.tBodyAccStdX
avg.tBodyAccStdY
avg.tBodyAccStdZ
avg.tGravityAccMeanX
avg.tGravityAccMeanY
avg.tGravityAccMeanZ
avg.tGravityAccStdX
avg.tGravityAccStdY
avg.tGravityAccStdZ
avg.tBodyAccJerkMeanX
avg.tBodyAccJerkMeanY
avg.tBodyAccJerkMeanZ
avg.tBodyAccJerkStdX
avg.tBodyAccJerkStdY
avg.tBodyAccJerkStdZ
avg.tBodyGyroMeanX
avg.tBodyGyroMeanY
avg.tBodyGyroMeanZ
avg.tBodyGyroStdX
avg.tBodyGyroStdY
avg.tBodyGyroStdZ
avg.tBodyGyroJerkMeanX
avg.tBodyGyroJerkMeanY
avg.tBodyGyroJerkMeanZ
avg.tBodyGyroJerkStdX
avg.tBodyGyroJerkStdY
avg.tBodyGyroJerkStdZ
avg.tBodyAccMagMean
avg.tBodyAccMagStd
avg.tGravityAccMagMean
avg.tGravityAccMagStd
avg.tBodyAccJerkMagMean
avg.tBodyAccJerkMagStd
avg.tBodyGyroMagMean
avg.tBodyGyroMagStd
avg.tBodyGyroJerkMagMean
avg.tBodyGyroJerkMagStd
avg.fBodyAccMeanX
avg.fBodyAccMeanY
avg.fBodyAccMeanZ
avg.fBodyAccStdX
avg.fBodyAccStdY
avg.fBodyAccStdZ
avg.fBodyAccJerkMeanX
avg.fBodyAccJerkMeanY
avg.fBodyAccJerkMeanZ
avg.fBodyAccJerkStdX
avg.fBodyAccJerkStdY
avg.fBodyAccJerkStdZ
avg.fBodyGyroMeanX
avg.fBodyGyroMeanY
avg.fBodyGyroMeanZ
avg.fBodyGyroStdX
avg.fBodyGyroStdY
avg.fBodyGyroStdZ
avg.fBodyAccMagMean
avg.fBodyAccMagStd
avg.fBodyBodyAccJerkMagMean
avg.fBodyBodyAccJerkMagStd
avg.fBodyBodyGyroMagMean
avg.fBodyBodyGyroMagStd
avg.fBodyBodyGyroJerkMagMean
avg.fBodyBodyGyroJerkMagStd

## *tidy_data_set.txt* Variables description
* #### activity and subject comes from the original human_activity data set.  
##### - *activity* has one of the following values:  
##### WALKING
##### WALKING_UPSTAIRS
##### WALKING_DOWNSTAIRS
##### SITTING
##### STANDING
##### LAYING
##### - *subject* has the values 1 to 30 representing the 30 persons who participate of the experiment.  

* #### The remaining variables are the average of the respective columns in human_activity data set, grouped by activity and subject.  
#### Those variables were renamed to reflect that they are now the average of their original values. The original names of those columns can be seen in the features data set.
