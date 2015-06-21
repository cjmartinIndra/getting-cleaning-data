## Data sets

### Raw data set

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

 * `tBodyAcc-XYZ`
 * `tGravityAcc-XYZ`
 * `tBodyAccJerk-XYZ`
 * `tBodyGyro-XYZ`
 * `tBodyGyroJerk-XYZ`
 * `tBodyAccMag`
 * `tGravityAccMag`
 * `tBodyAccJerkMag`
 * `tBodyGyroMag`
 * `tBodyGyroJerkMag`
 * `fBodyAcc-XYZ`
 * `fBodyAccJerk-XYZ`
 * `fBodyGyro-XYZ`
 * `fBodyAccMag`
 * `fBodyAccJerkMag`
 * `fBodyGyroMag`
 * `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are: 

 * `mean()`: Mean value
 * `std()`: Standard deviation
 * `mad()`: Median absolute deviation 
 * `max()`: Largest value in array
 * `min()`: Smallest value in array
 * `sma()`: Signal magnitude area
 * `energy()`: Energy measure. Sum of the squares divided by the number of values. 
 * `iqr()`: Interquartile range 
 * `entropy()`: Signal entropy
 * `arCoeff()`: Autorregresion coefficients with Burg order equal to 4
 * `correlation()`: correlation coefficient between two signals
 * `maxInds()`: index of the frequency component with largest magnitude
 * `meanFreq()`: Weighted average of the frequency components to obtain a mean frequency
 * `skewness()`: skewness of the frequency domain signal 
 * `kurtosis()`: kurtosis of the frequency domain signal 
 * `bandsEnergy()`: Energy of a frequency interval within the 64 bins of the FFT of each window.
 * `angle()`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

 * `gravityMean`
 * `tBodyAccMean`
 * `tBodyAccJerkMean`
 * `tBodyGyroMean`
 * `tBodyGyroJerkMean`
 

### Data transformation

The raw data sets are processed with run_analysis.R script to create a tidy data set.

### Merge training and test sets

Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt,
subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain
a single data set. Variables are labelled with the names assigned by original
collectors (features.txt). Duplicated variables are also removed.

### Extract mean and standard deviation variables

From the merged data set is extracted and intermediate data set with only the
values of estimated mean (variables with labels that contain "mean()") and standard
deviation (variables with labels that contain "std()"). 

Totally, the intermediate data set contains 68 variables:

 * `Subject` - An identifier of the subject who carried out the experiment.
 * `ActivityId` - Activity id.

Plus 66 filtered features.

### Use descriptive activity names

A new column (`Activity`) is added to intermediate data set with the activity description.
Activity id column is used to look up descriptions in activity_labels.txt. After the matching process, `ActivityId` column is removed.

### Label variables appropriately

Labels given from the original collectors were changed:
* to obtain valid R names without parentheses, dashes and commas
* to obtain more descriptive labels

### Create a tidy data set

From the intermediate data set is created a final tidy data set where numeric
variables are averaged for each activity and each subject.

The tidy data set contains 180 observations with 68 variables divided in:

*  an activity label (__Activity__): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*  an identifier of the subject who carried out the experiment (__Subject__):
   1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
*  a 66-feature vector with time and frequency domain signal variables (numeric)

### Variables in raw and tidy data set

 Raw data set | Tidy data set
 -------------|--------------
 `Subject` | `Subject`
 `Activity` | `Activity`
 `tBodyAcc-mean()-X` | `TimeDomain.BodyAcceleration.Mean.X`
 `tBodyAcc-mean()-Y` | `TimeDomain.BodyAcceleration.Mean.Y`
 `tBodyAcc-mean()-Z` | `TimeDomain.BodyAcceleration.Mean.X`
 `tBodyAcc-std()-X` | `TimeDomain.BodyAcceleration.StandardDeviation.X`
 `tBodyAcc-std()-Y` | `TimeDomain.BodyAcceleration.StandardDeviation.Y`
 `tBodyAcc-std()-Z` | `TimeDomain.BodyAcceleration.StandardDeviation.Z`
 `tGravityAcc-mean()-X` | `TimeDomain.GravityAcceleration.Mean.X`
 `tGravityAcc-mean()-Y` | `TimeDomain.GravityAcceleration.Mean.Y`
 `tGravityAcc-mean()-Z` | `TimeDomain.GravityAcceleration.Mean.Z`
 `tGravityAcc-std()-X` | `TimeDomain.GravityAcceleration.StandardDeviation.X`
 `tGravityAcc-std()-Y` | `TimeDomain.GravityAcceleration.StandardDeviation.Y`
 `tGravityAcc-std()-Z` | `TimeDomain.GravityAcceleration.StandardDeviation.Z`
 `tBodyAccJerk-mean()-X` | `TimeDomain.BodyAccelerationJerk.Mean.X`
 `tBodyAccJerk-mean()-Y` | `TimeDomain.BodyAccelerationJerk.Mean.Y`
 `tBodyAccJerk-mean()-Z` | `TimeDomain.BodyAccelerationJerk.Mean.Z`
 `tBodyAccJerk-std()-X` | `TimeDomain.BodyAccelerationJerk.StandardDeviation.X`
 `tBodyAccJerk-std()-Y` | `TimeDomain.BodyAccelerationJerk.StandardDeviation.Y`
 `tBodyAccJerk-std()-Z` | `TimeDomain.BodyAccelerationJerk.StandardDeviation.Z`
 `tBodyGyro-mean()-X` | `TimeDomain.BodyAngularSpeed.Mean.X`
 `tBodyGyro-mean()-Y` | `TimeDomain.BodyAngularSpeed.Mean.Y`
 `tBodyGyro-mean()-Z` | `TimeDomain.BodyAngularSpeed.Mean.Z`
 `tBodyGyro-std()-X` | `TimeDomain.BodyAngularSpeed.StandardDeviation.X`
 `tBodyGyro-std()-Y` | `TimeDomain.BodyAngularSpeed.StandardDeviation.Y`
 `tBodyGyro-std()-Z` | `TimeDomain.BodyAngularSpeed.StandardDeviation.Z`
 `tBodyGyroJerk-mean()-X` | `TimeDomain.BodyAngularAcceleration.Mean.X`
 `tBodyGyroJerk-mean()-Y` | `TimeDomain.BodyAngularAcceleration.Mean.Y`
 `tBodyGyroJerk-mean()-Z` | `TimeDomain.BodyAngularAcceleration.Mean.Z`
 `tBodyGyroJerk-std()-X` | `TimeDomain.BodyAngularAcceleration.StandardDeviation.X`
 `tBodyGyroJerk-std()-Y` | `TimeDomain.BodyAngularAcceleration.StandardDeviation.Y`
 `tBodyGyroJerk-std()-Z` | `TimeDomain.BodyAngularAcceleration.StandardDeviation.Z`
 `tBodyAccMag-mean()` | `TimeDomain.BodyAccelerationMagnitude.Mean`
 `tBodyAccMag-std()` | `TimeDomain.BodyAccelerationMagnitude.StandardDeviation`
 `tGravityAccMag-mean()` | `TimeDomain.GravityAccelerationMagnitude.Mean`
 `tGravityAccMag-std()` | `TimeDomain.GravityAccelerationMagnitude.StandardDeviation`
 `tBodyAccJerkMag-mean()` | `TimeDomain.BodyAccelerationJerkMagnitude.Mean`
 `tBodyAccJerkMag-std()` | `TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation`
 `tBodyGyroMag-mean()` | `TimeDomain.BodyAngularSpeedMagnitude.Mean`
 `tBodyGyroMag-std()` | `TimeDomain.BodyAngularSpeedMagnitude.StandardDeviation`
 `tBodyGyroJerkMag-mean()` | `TimeDomain.BodyAngularAccelerationMagnitude.Mean`
 `tBodyGyroJerkMag-std()` | `TimeDomain.BodyAngularAccelerationMagnitude.StandardDeviation`
 `fBodyAcc-mean()-X` | `FrequencyDomain.BodyAcceleration.Mean.X`
 `fBodyAcc-mean()-Y` | `FrequencyDomain.BodyAcceleration.Mean.Y`
 `fBodyAcc-mean()-Z` | `FrequencyDomain.BodyAcceleration.Mean.Z`
 `fBodyAcc-std()-X` | `FrequencyDomain.BodyAcceleration.StandardDeviation.X`
 `fBodyAcc-std()-Y` | `FrequencyDomain.BodyAcceleration.StandardDeviation.Y`
 `fBodyAcc-std()-Z` | `FrequencyDomain.BodyAcceleration.StandardDeviation.Z`
 `fBodyAccJerk-mean()-X` | `FrequencyDomain.BodyAccelerationJerk.Mean.X`
 `fBodyAccJerk-mean()-Y` | `FrequencyDomain.BodyAccelerationJerk.Mean.Y`
 `fBodyAccJerk-mean()-Z` | `FrequencyDomain.BodyAccelerationJerk.Mean.Z`
 `fBodyAccJerk-std()-X` | `FrequencyDomain.BodyAccelerationJerk.StandardDeviation.X`
 `fBodyAccJerk-std()-Y` | `FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Y`
 `fBodyAccJerk-std()-Z` | `FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Z`
 `fBodyGyro-mean()-X` | `FrequencyDomain.BodyAngularSpeed.Mean.X`
 `fBodyGyro-mean()-Y` | `FrequencyDomain.BodyAngularSpeed.Mean.Y`
 `fBodyGyro-mean()-Z` | `FrequencyDomain.BodyAngularSpeed.Mean.Z`
 `fBodyGyro-std()-X` | `FrequencyDomain.BodyAngularSpeed.StandardDeviation.X`
 `fBodyGyro-std()-Y` | `FrequencyDomain.BodyAngularSpeed.StandardDeviation.Y`
 `fBodyGyro-std()-Z` | `FrequencyDomain.BodyAngularSpeed.StandardDeviation.Z`
 `fBodyAccMag-mean()` | `FrequencyDomain.BodyAccelerationMagnitude.Mean`
 `fBodyAccMag-std()` | `FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation`
 `fBodyBodyAccJerkMag-mean()` | `FrequencyDomain.BodyAccelerationJerkMagnitude.Mean`
 `fBodyBodyAccJerkMag-std()` | `FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation`
 `fBodyBodyGyroMag-mean()` | `FrequencyDomain.BodyAngularSpeedMagnitude.Mean`
 `fBodyBodyGyroMag-std()` | `FrequencyDomain.BodyAngularSpeedMagnitude.StandardDeviation`
 `fBodyBodyGyroJerkMag-mean()` | `FrequencyDomain.BodyAngularAccelerationMagnitude.Mean`
 `fBodyBodyGyroJerkMag-std()` | `FrequencyDomain.BodyAngularAccelerationMagnitude.StandardDeviation`
