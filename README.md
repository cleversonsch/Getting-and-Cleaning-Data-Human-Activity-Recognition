# Getting-and-Cleaning-Data-Human-Activity-Recognition

The main idea of human activity recognition is to collect information to improve healthcare. However, recognizing common human activities in real life settings is challenging as they may be complex and very different. On top of that, many companies are today offering wearable devices with complex algorithms to collect data.    
The project here was based on a study, where sensors and Samsung Galaxy S smartphone were used to recognize human activity and collect data. The objective of this project is to get these data, clean it and creating a tidy data set in the end. 
The following files are in this repository: 
1.	README.md that explains the analysis files how it was created.
2.	CodeBook.md that describes the variables, the data and work performed to clean up the data.
3.	tidy.txt that is the file containing the tidy data set.
4.	run_analysis.R that is the script to get the data, clean it and create a tidy data set. 

# Description of experiment:

From: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Creating data set

Using the data sets (test and train) collected in the experiment, the run_analysis.R script merges these data and creating a new data set by only extracting the mean and standard deviation measurements. From this data set, a second tidy data set with the average of each variable for each activity and each subject is created. The script performs the following operations:
1.	Download and unzip source data.
2.	Read the data.
3.	Assign news variable names following the experiment description.
4.	Merge train and test data sets.
5.	Extract mean and standard deviation measurements.
6.	Optimize variable names.
7.	Enter activity description names on activity observations.
8.	Create a second tidy set with the average of each variable for each activity and each subject.
9.	Write the tidy data set to tidy.txt file.
