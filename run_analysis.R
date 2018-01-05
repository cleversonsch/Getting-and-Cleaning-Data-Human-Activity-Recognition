#File run_analysis.R
# 
#Script output file "tidy.txt"
#
#Human Activity Recognition Using Smartphones Dataset
#
#See README.md for experiment detail


#Loading "dplyr" package for data frame managment
  library(dplyr)
  
#Getting Data - HAR(Human Activity Recognition)
  fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,"HAR.zip")
  unzip("HAR.zip")
  
#Reading Data - read.table(unzipped file path/unzipped file name) 
#
##TEST Data
  test_x<-read.table("UCI HAR Dataset/test/X_test.txt")
  test_y<-read.table("UCI HAR Dataset/test/y_test.txt")
  test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")

##TRAIN Data
  train_x<-read.table("UCI HAR Dataset/train/X_train.txt")
  train_y<-read.table("UCI HAR Dataset/train/y_train.txt")
  train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")

##ACTIVITY LABEL AND FEATURES Data  
  activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
  features<-read.table("UCI HAR Dataset/features.txt")

#Assign variable names names 
  names(train_subject)<-"Subject"
  names(test_subject)<-"Subject"
  names(test_y)<-"Activity"
  names(train_y)<-"Activity"
  names(test_x)<-features[,2]
  names(train_x)<-features[,2]

#Merging TEST and TRAIN data
  train <- cbind(train_subject, train_y, train_x)
  test <- cbind(test_subject, test_y, test_x)
  AllData<-rbind(train,test)

#Selecting data to keep
  KeptVariable<- grepl("Subject|Activity|mean|std",names(AllData))
  KeptData<-AllData[,KeptVariable==TRUE]

#Optimizing variable names
  names(KeptData)<-gsub("[-()]","",names(KeptData))
  
#Enter activity names on "Activity" variable
  KeptData$Activity<-factor(KeptData$Activity,levels = activity_labels[,1],labels = activity_labels[,2])

#Creating a second tidy data set with average of each variable grouped by subject and activity
#Grouping data
  KeptDataMean<-KeptData %>% group_by(Subject, Activity) %>% summarize_all(funs(mean))

#Creating output file
  write.table(KeptDataMean, "tidy.txt", quote=FALSE, row.names = FALSE)