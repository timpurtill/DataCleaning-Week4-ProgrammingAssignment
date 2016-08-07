#CODEBOOK.md

This file describes the detailed steps executed by the R Script "run_analysis.R" to produce the summarized tiday data set output file "aggregated_means.txt"

#Steps Performed by the script

##Downloading and unzipping the data

* Check to see if the data set has already been downloaded and unzipped to the working directory
* If it hasn't, download and unzip the data files

## Reading in all the data from the different files and combining it
* Read in the feature names from features.txt
* Read in the activity names from activity_labels.txt

* Get all the test data from /test/y_test.txt, /test/x_test.txt, /test/subject_test.txt
* Combine the three separate test dfs into a single test df by appending the subject (subject_test) and activity (y_test) as additional columns onto the observations test set (x_test)

* Get all the train data from /train/y_train.txt, /train/X_train.txt, /train/subject_train.txt
* Combine the three separate train dfs into a single training df by appending the subject (subject_train) and activity (y_train) as additional columns onto the observations train set (x_train)

* Using rbind combine the single test df and the single training df into a single df

* Replace the column names with the feature names from the feature.txt file

## We now have a completed consolidated set of test and training data in one dataframe with the features correctly labled, however the activity is just an ID, but we have a file with the descriptive names of these activities

* Merge the main data set with the activity names to have descriptive activity names instead of numbers
* NOTE:  The entire table ends up being sorted by the indices chosen for merging; however as all the data is already present in the dataframe the association between the data is not lost
* Rename the merged column "V2" to "activity"
* Drop the "activity-number" column as this redundant data now we have the activity names instead

## We now have a completed consolidated set of test and training data in one dataframe with the features correctly labled, the descriptive names of the activity performed for each observation

## Next we need to find all the features that represent a mean or standard deviation (std)

* Find the indexes of the column names that contain "mean", or "std" anywhere within the name
* Check for all caps combos just in case - expression:  "[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]"
* Also make sure we keep the subject and activity columns in our new mean/std data set
* Place the subject and activity columns at the "front" of the data frame for readability
* Resulting in a complete data set containing only features that are means or standard deviations

## As per the assignment description we want to group by the subject and activity and caluate the average for the mean and standard deviation features for these groups

* Group by the subject and the activity and apply the mean function to the rest of the data set using the aggregate function
* This summarized tidy data set contains 180 observations of 88 variables - each describing the average for the mean and standard deviation features from the original data sets for each subject and activity

## Write the new aggregated tidy data set to a file called "aggregated_means.txt"

* Use the function write.table to save the resulting summarized tidy data set to "aggregated_means.txt"

