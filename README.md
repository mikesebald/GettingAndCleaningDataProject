# GettingAndCleaningDataProject

The R script run_analysis.R creates a tidy data set as requested by the course project of the Coursera 
"Getting and Cleaning Data" project.

The main purpose is to clean data which was gathered during the "Human Activity Recognition Using Smartphones"
experiment: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
In this experiment 30 individuals carried out six different activities. The indivdual's velocity and accelearation 
was captured using a smartphone. The collected data is the basis for this exercise.

The original data set is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please refer to the two files features_info.txt and README.txt included in the zipped data set.

This script basically: 
1. reads two data sets (train and test),
2. concatenates both data sets,
3. eliminates  irrelevant columns,
4. renames the columns of the data set,
5. adds two columns for the individual and the activity performed,
6. calculates the mean value for each of the relevant columns by individual and by activity and
7. stores this data set in a file.

For any questions, please contact michael.sebald@gmail.com
