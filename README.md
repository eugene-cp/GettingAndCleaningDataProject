Tidying Data from the Human Activity Recognition Using Smartphones Dataset version 1.0

The script run_analysis.R tidies the data collected from the experiment Human Activity Recognition Using Smartphones Dataset Version 1.0 conducted by Smartlab - Non Linear Complex Systems Laboratory.  The data from this experiment is available for download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The run_analysis.R script performs the following steps:
1. Download the experiment data from the source URL above.
2. Extracts the download file into the /data subdirectory of the project.
3. Loads the FIELD/FEATURE names from /data/UCI HAR Dataset/features.txt.
4. Loads the TRAINING data from /data/UCI HAR Dataset/train folder using the previously FIELD names.
5. Loads the TEST data from /data/UCI HAR Dataset/test folder using the previously loaded FIELD names.
6. Merges the TRAINING and TEST data into a single data set.
7. In the merged data set, extracted only the measurements for mean and standard deviation for each measurement.
8. Cleand up the column names to be more readable in the extracted data set.
9. Transformed the ACTIVITY field to use descriptive names as defined in /data/UCI HAR Dataset/activity_labels.txt.
10. Saved the tidy dataset to /data/analysis/HAR Dataset - Tidy.csv
11. Created a second tidy dataset with the average of each variable for ech activity and each subject and saved it to /data/analysis/HAR Dataset - Summarized by Activey and Subject.csv

References:
- Original dataset provided by [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
