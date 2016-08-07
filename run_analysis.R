
## Download and unzip the data files if not already present
if (length(dir(".", pattern = "^UCI HAR Dataset$", full.names = FALSE, ignore.case = TRUE))==0){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "FUCI HAR Dataset.zip", method = "curl")
        unzip("FUCI HAR Dataset.zip", exdir = ".")
}

## Read in the feature names
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
## Read in the activity names
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

##Get all the test data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

##Combine the three separate test dfs into a single test df
combined_test_df <- x_test
combined_test_df["subject"] <- subject_test$V1
combined_test_df["activity-number"] <- y_test$V1

##Get all the training data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
##Note the upper case X in the file name
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

##Combine the three separate training dfs into a single train df
combined_train_df <- x_train
combined_train_df["subject"] <- subject_train$V1
combined_train_df["activity-number"] <- y_train$V1

## Combine the test and training dfs into a single consolidated df
combined_train_test_df <-rbind(combined_test_df, combined_train_df)

## Replace the column names with the feature names from the feature.txt file
column_labled_df <- combined_train_test_df
## Only want to update the names of the first 561 columns
## as the last two columns added manually are already correctly labled
colnames(column_labled_df)[1:561] <- as.character(features[["V2"]])

## Merge the main data set with the activity names to have descriptive activity names instead of numbers
## NOTE:  The entire table ends up being sorted by the indices chosen for merging
activity_names_df <- merge(column_labled_df, activity_names, by.x = "activity-number", by.y = "V1", all = TRUE)

## Rename the merged column to "activity"
colnames(activity_names_df)[564] <- "activity"

## Drop the "activity-number" column
activity_names_df <- activity_names_df[-1]

## Find the indexes of the column names with "mean", or "std"
## Check for all caps combos just in case
## We also want to keep the subject and activity columns in our new mean/std data set
## Cols 562 and 563 respectively so now we have a complete list of all the columns we want to keep
## Put the subject and activity columns at the "front" of the data frame for readability
columnIndexesToKeep <- c(562, 563, grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", colnames(activity_names_df)))

## Apply the indexed list of columns to keep and create the new mean and std dataframe
mean_std_df <- activity_names_df[columnIndexesToKeep]

## Group by the subject and the activity and apply the mean function to the rest of the data set
average_mean_std_df <- aggregate(mean_std_df[, 3:88], list(subject = mean_std_df$subject, activity = mean_std_df$activity), mean)

## Write the new aggregated tidy data set to a file called "aggregated_means.txt"
write.table(average_mean_std_df,file = "aggregated_means.txt",col.names = TRUE)

