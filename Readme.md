The repository contains the analysis of the UCI Machine Learning experience named:
Human Activity Recognition Using Smartphones Data Set

The original datasets can be downloaded on:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file should be unzipped to a folder named “UCI HAR Dataset” 
The relevant structure is the following:
> UCI HAR Dataset
   - activity_labels.txt
   - features.txt
   > test
      - subject_test.txt
      - X_test.txt
      - y_test.txt
   > train
      - subject_test.txt
      - X_test.txt
      - y_test.txt

You can find the following files:
- A script file, run_analysis.R containing the algorithm to produce datasets with tidy data
The script combines all the above files into two independent datasets with tidy data
     - Readme.md, the current document
     - CodeBook.md, explaining the variables and the procedures to tidy the data

In order for thet script to work you should set the working directory to the folder that contains the UCI HAR Dataset folder.

