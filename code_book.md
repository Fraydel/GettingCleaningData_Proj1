Codebook for the tidy_data_set.txt

The features selected for this dataset are the ones that have something to do with
mean or standard deviation (as the assignment instructions stated).

The final look of the tidy dataset variable names of the first two column is as follows:

* activity: activity type
* participant: participant ID

The rest of the variable description follow this definitions, as extracted and adapted from the original features_info.txt:

* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

* These time domain signals (prefix 'time_' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
 the acceleration signal was then separated into body and gravity acceleration signals (time_Body_Acc_XYZ and time_Gravity_Acc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_Body_Acc_Jerk_XYZ and time_Body_Gyro_Jerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_Body_Acc_Mag, time_Gravity_Acc_Mag, time_Body_Acc_Jerk_Mag, time_Body_Gyro_Mag, time_Body_Gyro_Jerk_Mag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freq_Body_Acc_XYZ, freq_Body_Acc_Jerk_XYZ, freq_Body_Gyro_XYZ, freq_Body_Acc_Jerk_Mag, freq_Body_Gyro_Mag, freq_Body_Gyro_Jerk_Mag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean


* time_body_acc_mean_x
* time_body_acc_mean_y
* time_body_acc_mean_z
* time_body_acc_std_x
* time_body_acc_std_y
* time_body_acc_std_z
* time_gravity_acc_mean_x
* time_gravity_acc_mean_y
* time_gravity_acc_mean_z
* time_gravity_acc_std_x
* time_gravity_acc_std_y
* time_gravity_acc_std_z
* time_body_acc_jerk_mean_x
* time_body_acc_jerk_mean_y
* time_body_acc_jerk_mean_z
* time_body_acc_jerk_std_x
* time_body_acc_jerk_std_y
* time_body_acc_jerk_std_z
* time_body_gyro_mean_x
* time_body_gyro_mean_y
* time_body_gyro_mean_z
* time_body_gyro_std_x
* time_body_gyro_std_y
* time_body_gyro_std_z
* time_body_gyro_jerk_mean_x
* time_body_gyro_jerk_mean_y
* time_body_gyro_jerk_mean_z
* time_body_gyro_jerk_std_x
* time_body_gyro_jerk_std_y
* time_body_gyro_jerk_std_z
* time_body_acc_mag_mean
* time_body_acc_mag_std
* time_gravity_acc_mag_mean
* time_gravity_acc_mag_std
* time_body_acc_jerk_mag_mean
* time_body_acc_jerk_mag_std
* time_body_gyro_mag_mean
* time_body_gyro_mag_std
* time_body_gyro_jerk_mag_mean
* time_body_gyro_jerk_mag_std
* freq_body_acc_mean_x
* freq_body_acc_mean_y
* freq_body_acc_mean_z
* freq_body_acc_std_x
* freq_body_acc_std_y
* freq_body_acc_std_z
* freq_body_acc_meanfreq_x
* freq_body_acc_meanfreq_y
* freq_body_acc_meanfreq_z
* freq_body_acc_jerk_mean_x
* freq_body_acc_jerk_mean_y
* freq_body_acc_jerk_mean_z
* freq_body_acc_jerk_std_x
* freq_body_acc_jerk_std_y
* freq_body_acc_jerk_std_z
* freq_body_acc_jerk_meanfreq_x
* freq_body_acc_jerk_meanfreq_y
* freq_body_acc_jerk_meanfreq_z
* freq_body_gyro_mean_x
* freq_body_gyro_mean_y
* freq_body_gyro_mean_z
* freq_body_gyro_std_x
* freq_body_gyro_std_y
* freq_body_gyro_std_z
* freq_body_gyro_meanfreq_x
* freq_body_gyro_meanfreq_y
* freq_body_gyro_meanfreq_z
* freq_body_acc_mag_mean
* freq_body_acc_mag_std
* freq_body_acc_mag_meanfreq
* freq_body_acc_jerk_mag_mean
* freq_body_acc_jerk_mag_std
* freq_body_acc_jerk_mag_meanfreq
* freq_body_gyro_mag_mean
* freq_body_gyro_mag_std
* freq_body_gyro_mag_meanfreq
* freq_body_gyro_jerk_mag_mean
* freq_body_gyro_jerk_mag_std
* freq_body_gyro_jerk_mag_meanfreq
* angle(tbody_acc_mean,gravity_)
* angle(tbody_acc_jerk_mean),gravity_mean)
* angle(tbody_gyro_mean,gravity_mean)
* angle(tbody_gyro_jerk_mean,gravity_mean)
* angle(x,gravity_mean)
* angle(y,gravity_mean)
* angle(z,gravity_mean)

The rest of the estimates were removed to do the exercise.