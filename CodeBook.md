Code  Book

The tidy data set contains:

Column 1, "SubjectID": the ID (a number) of the individual who carried out the activity (1, 2, 3, ...)
Column 2, "Activity": the activity performed (WALKING, WALKING_UPSAIRS, SITTING, ...)
Columns 3-88: the mean values of each measurement by individual and by activity

Columns 3-88 are named based on the naming used in features.txt. Please see the readme.md for further details.

The naming of columns 3-88 has been "improved" by
- eliminating characters like '(', ')', '-', ...
- by "reverting" the abbreviations used in the original names, i.e. "Accelerometer" rather than "Acc"
- capitalizing "std" and "mean"
- and a few other improvements which should improve readability
- Example: "tBodyAcc-mean()-X" becomes "TimeBodyAccelerometerMeanX"

In contrast to the original data set, the tidy data set only contains the columns which store mean and standard 
deviation values (plus 2 columns in front for the individual and the activity).

The tidy data set also aggregates the original data by calculation the mean for each column by subject and 
by activity.