# Tidying Data from the Human Activity Recognition Using Smartphones Dataset version 1.0

## Original Data
From the original experiment[1], the following fields/variables were available:

The data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

## Tidy Data
For the purpose of the tidy data required, we only extracted fields/variables measuring the means or standard deviations for each measurement from the original data.

We also merged the data coming from both the TRAINING and TEST data sets.  For each of the TRAINING and TEST data sets, the files for X, Y and SUBJECT were joined before merging. The resulting data set which can be found at **/data/analysis/HAR Dataset - Tidy.csv** has the following variables:

- **subject** - subject ID
- **activity** - activity defined as any of the following: **WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**

The remaining variables below are just an extract for the Mean and STD measurements from the original data:
- tBody Acceleration - Mean() - X
- tBody Acceleration - Mean() - Y
- tBody Acceleration - Mean() - Z
- tBody Acceleration - STD() - X
- tBody Acceleration - STD() - Y
- tBody Acceleration - STD() - Z
- tGravity Acceleration - Mean() - X
- tGravity Acceleration - Mean() - Y
- tGravity Acceleration - Mean() - Z
- tGravity Acceleration - STD() - X
- tGravity Acceleration - STD() - Y
- tGravity Acceleration - STD() - Z
- tBody Acceleration Jerk - Mean() - X
- tBody Acceleration Jerk - Mean() - Y
- tBody Acceleration Jerk - Mean() - Z
- tBody Acceleration Jerk - STD() - X
- tBody Acceleration Jerk - STD() - Y
- tBody Acceleration Jerk - STD() - Z
- tBody Gyro - Mean() - X
- tBody Gyro - Mean() - Y
- tBody Gyro - Mean() - Z
- tBody Gyro - STD() - X
- tBody Gyro - STD() - Y
- tBody Gyro - STD() - Z
- tBody Gyro Jerk - Mean() - X
- tBody Gyro Jerk - Mean() - Y
- tBody Gyro Jerk - Mean() - Z
- tBody Gyro Jerk - STD() - X
- tBody Gyro Jerk - STD() - Y
- tBody Gyro Jerk - STD() - Z
- tBody Acceleration Magnitude - Mean()
- tBody Acceleration Magnitude - STD()
- tGravity Acceleration Magnitude - Mean()
- tGravity Acceleration Magnitude - STD()
- tBody Acceleration Jerk Magnitude - Mean()
- tBody Acceleration Jerk Magnitude - STD()
- tBody Gyro Magnitude - Mean()
- tBody Gyro Magnitude - STD()
- tBody Gyro Jerk Magnitude - Mean()
- tBody Gyro Jerk Magnitude - STD()
- fBody Acceleration - Mean() - X
- fBody Acceleration - Mean() - Y
- fBody Acceleration - Mean() - Z
- fBody Acceleration - STD() - X
- fBody Acceleration - STD() - Y
- fBody Acceleration - STD() - Z
- fBody Acceleration Jerk - Mean() - X
- fBody Acceleration Jerk - Mean() - Y
- fBody Acceleration Jerk - Mean() - Z
- fBody Acceleration Jerk - STD() - X
- fBody Acceleration Jerk - STD() - Y
- fBody Acceleration Jerk - STD() - Z
- fBody Gyro - Mean() - X
- fBody Gyro - Mean() - Y
- fBody Gyro - Mean() - Z
- fBody Gyro - STD() - X
- fBody Gyro - STD() - Y
- fBody Gyro - STD() - Z
- fBody Acceleration Magnitude - Mean()
- fBody Acceleration Magnitude - STD()
- fBody Body Acceleration Jerk Magnitude - Mean()
- fBody Body Acceleration Jerk Magnitude - STD()
- fBody Body Gyro Magnitude - Mean()
- fBody Body Gyro Magnitude - STD()
- fBody Body Gyro Jerk Magnitude - Mean()
- fBody Body Gyro Jerk Magnitude - STD()

For the second tidy data output **/data/analysis/HAR Dataset - Summarized by Activity and Subject.csv**, it summarizes the first data output based on the average of each variable for each activity and each subject.  Similar fields and variables are available as to the first data output.



## References:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 / https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
