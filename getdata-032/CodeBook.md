## CodeBook

Use this document in parallel with the README.md for a complete understanding of 
the code as well as the resulting 'wearables_tidydata.csv' file.

Code Variables:
    
The following variables all store data from zip file from UCI:
    
activity_labels : table used to store data from the activity_lables.txt file
features : table used to store data from the features.txt file
X_test : table used to store data from the X_test.txt file
y_test  : table used to store data from the y_test.txt file
subject_test : table used to store data from the subject_test.txt file
X_train : table used to store data from the X_train.txt file
y_train : table used to store data from the y_train.txt file
subject_train : table used to store data from the subject_train.txt file

X_merge : holds the combined data from X_test and X_train & also holds the 
    resultings set after grepl takes only the mean and std data
y_merge : holds the combined data from y_test and y_train
subject_merge : holds the combined data from subject_test and subject_train
Xy_merge : takes the merged X and y data, combining the measurements and the 
    activity codes
mergedData : takes the Activity names using the 'merge' function
tidyData : the final, and clean dataset which uses the group_by function to 
    collect the data by Subject and Activity and the summarize_each function 
    to provide the means for each column

File variables:
    
Added Variables:

Subject : as consistent with the original data, these are people numbered 1:30
Activity : one of 6 activities: LAYING, SITTING, STANDING, WALKING,  
    WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

Below is the original Codex for the other variables:
    
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

The complete list of variables of each feature vector is available in 'features.txt'
