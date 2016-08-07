# Data Cleaning - Week 4 - Programming Assignment
Git Hub repository containing the requisite README.md, CODEBOOK.md, run_analysis.R, and an aggregated_means.txt file

The README.md file (this file) contains a description of the overall objectives of the exercise, the files contained within the repository and how to execute the script to generate the resulting "aggregated_means.txt" file.

##Data used for the exercise
The data and its description can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

(excerpt from the data's READ ME file)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Each of the base data are the observations of acceleration through the three axes (x, y, z) as captured by the smartphone accelerometer and measured in standard gravity units 'g'.

Please note the Inertial Signals files were not processed as the cited objective below required the summary of the mean and standard deviation data, which is not present in these files.

##Objective
As per the Data Science - Week 4 - Programming assignment, demonstrate sufficient R scripting knowledge to combine and summarize a set of partitioned data sets into a single summarized data set.

For this exercise this required combining all of the appropriate test and subject identifiers with the test results across both the training and test data sets from the data set cited above; and creating an average of the mean and standard deviation data for each subject for each activity.

Resulting in a single, summarized, tidy data set showing the averages across of the mean and standard deviation data for each subject for each activity.  The R script generates this summarized data set as an R table output to "aggregated_means.txt"

##Using the R-Script:  run_analysis.R

This is the only script file required to generate the summarized output "aggregated_means.txt".  Running this R script in a given working directory will:
* Check to see if the data files have already been downloaded and unzipped
* If they haven't, the data set for the exercise is downloaded
* Please note this file is 60Mb so may take some time to download depending on your connection speed
* Unzip the data set into a directory called "UCI HAR Dataset"
* Combines and collates the data sets into a summarized tidy data set
* Writes an R table file containing the summarized tidy data set as "aggregated_means.txt"

Please review the CODEBOOK.md for details on how the R script manipulates and formats the data to produce the end result.

##The resulting output:  aggregated_means.txt

The example output file which is the result of running the "run_analysis.R" script is a file containing the averaged means and standard deviations of the acceleration observations (measured in standard gravity units 'g') for each subject (1-30) for each activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

##CODEBOOK.md

A detailed description of the steps and actions executed by the "run_analysis.R" script in transforming the sourced data set into the summarized tidy data set, and resulting output file "aggregated_means.txt"


