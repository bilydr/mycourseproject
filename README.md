Getting and Cleaning Data: Course Project
=========================================


This repository contains my work for the course project for the Coursera course "Getting and Cleaning data"
What follows first are my notes on the original data.

Data Source
------------------

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
I downloaded the file on Oct 24, 2014 and extracted it to working directory of my RStudio. It is hosted in a subfolder called "UCI HAR Dataset" there.

R script 
-------------------------------------
The script file run_analysis.R performs the following transformations as required by the course project
Prerequisites for this script:

    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive variable names. 
    5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.
