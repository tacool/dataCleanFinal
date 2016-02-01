Data Set Information
=================

Introduction

The present dataset was compiled upon the work from UCI - Machine Learning Repository 
The original files are available on the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original files contains the folowing information:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Tidying and filtering

The final datasets were compiled by running the script: messy2tidy.R

The script uses the R libraries "dyplr" and "tidyr"

The above variables were filtered and only the measuremnts on the mean and standard deviation remained.

The script produces two independently tidy sets of data:

Dataset 1: data

data is a dataframe containing the following columns:

subject (int)
Number of the subject from which data was gathered 
Values:
1, 2, ..., 30

test (dbl)
test flag that indicates if the data refers to the test or train data
Values:
1 - test data
0 - train data

activity (factor)
type of activity measured
Levels: 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

variable (chr)
Variable measured
Values:
"tBodyAcc-X"
"tBodyAcc-Y"           
"tBodyAcc-Z"           
"tGravityAcc-X"       
"tGravityAcc-Y"        
"tGravityAcc-Z"        
"tBodyAccJerk-X"       
"tBodyAccJerk-Y"      
"tBodyAccJerk-Z"       
"tBodyGyro-X"          
"tBodyGyro-Y"          
"tBodyGyro-Z"         
"tBodyGyroJerk-X"      
"tBodyGyroJerk-Y"      
"tBodyGyroJerk-Z"      
"tBodyAccMag"         
"tGravityAccMag"       
"tBodyAccJerkMag"      
"tBodyGyroMag"         
"tBodyGyroJerkMag"    
"fBodyAcc-X"           
"fBodyAcc-Y"           
"fBodyAcc-Z"           
"fBodyAccJerk-X"      
"fBodyAccJerk-Y"       
"fBodyAccJerk-Z"       
"fBodyGyro-X"          
"fBodyGyro-Y"         
"fBodyGyro-Z"          
"fBodyAccMag"          
"fBodyBodyAccJerkMag"  
"fBodyBodyGyroMag"    
"fBodyBodyGyroJerkMag"

stat (chr)
Indicates if the measure is average or standard deviation
Values:
mean - average, 
std - standard deviation

value (dbl)
Contains the measured value


Dataset 2: dmean

Contains the average of each variable for each activity and each subject.

dmean is a dataframe containing the following columns:

subject (int)
Number of the subject from which data was gathered 
Values:
1, 2, ..., 30

activity (factor)
type of activity measured
Levels: 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

variable (chr)
Variable measured
Values:
"tBodyAcc-X"
"tBodyAcc-Y"           
"tBodyAcc-Z"           
"tGravityAcc-X"       
"tGravityAcc-Y"        
"tGravityAcc-Z"        
"tBodyAccJerk-X"       
"tBodyAccJerk-Y"      
"tBodyAccJerk-Z"       
"tBodyGyro-X"          
"tBodyGyro-Y"          
"tBodyGyro-Z"         
"tBodyGyroJerk-X"      
"tBodyGyroJerk-Y"      
"tBodyGyroJerk-Z"      
"tBodyAccMag"         
"tGravityAccMag"       
"tBodyAccJerkMag"      
"tBodyGyroMag"         
"tBodyGyroJerkMag"    
"fBodyAcc-X"           
"fBodyAcc-Y"           
"fBodyAcc-Z"           
"fBodyAccJerk-X"      
"fBodyAccJerk-Y"       
"fBodyAccJerk-Z"       
"fBodyGyro-X"          
"fBodyGyro-Y"         
"fBodyGyro-Z"          
"fBodyAccMag"          
"fBodyBodyAccJerkMag"  
"fBodyBodyGyroMag"    
"fBodyBodyGyroJerkMag"

stat (chr)
Indicates if the measure is average or standard deviation
Values:
mean - average, 
std - standard deviation

value (dbl)
Contains the average of the measured values
