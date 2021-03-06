library(dplyr)

# Read the feature names to use them later as column names. Considering the different project members this is probably 
# the least common denominator.
# Also read the activity labels, clean the relevant ones and add them to each row - which enhances readability from my point of view.
activity_labels <- read.table("activity_labels.txt")

features <- read.table("features.txt")
features[,2] <- gsub("[-,()]", "", features[,2])
features[,2] <- gsub("Acc", "Accelerometer", features[,2])
features[,2] <- gsub("Gyro", "Gyroscope", features[,2])
features[,2] <- gsub("Mag", "Magnitude", features[,2])
features[,2] <- gsub("Freq", "Frequency", features[,2])
features[,2] <- gsub("mean", "Mean", features[,2])
features[,2] <- gsub("std", "Std", features[,2])
features[,2] <- gsub("gravity", "Gravity", features[,2])
features[,2] <- gsub("^t", "Time", features[,2])
features[,2] <- gsub("^f", "FFT", features[,2])
column_names <- c("SubjectID", "Activity", as.character(features[,2]))

# Process TEST data set
#----------------------
# Read the files (the files are relatively small so I am not using fread() here)
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Put all together and set decent column names 
test_set <- cbind(subject_test, y_test, x_test)
colnames(test_set) <- column_names

# Do the same for the TRAIN data set
#-----------------------------------
# Read the files 
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Put all together and set decent column names
train_set <- cbind(subject_train, y_train, x_train)
colnames(train_set) <- column_names

# Put the TEST and the TRAIN data frames together
both_sets <- rbind(test_set, train_set)

# Determine the  relevant columns i.e all columns where its name includes either "mean" or"std"
mean_columns <- grep("Mean", features[,2])
std_columns <- grep("Std", features[,2])
relevant_columns <- sort(c(mean_columns, std_columns))

# now add 2 because the first two column of the datat set are the subject and the activity
relevant_columns <- relevant_columns + 2

# craete a new data set which includes the subject, the activity and the mean and std columns only (2+86 columns)
mean_std_set <- both_sets[, c(1, 2, relevant_columns)]

# create second independent tidy data set with the average of each variable for each activity and each subject.
final_set <- mean_std_set %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))

# name the activities
final_set <- mutate(final_set, Activity = activity_labels[Activity,2])

# finally write everything to disk
write.table(final_set, "final_set.txt", row.names = FALSE)
