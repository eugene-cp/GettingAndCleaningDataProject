# Tidying Data from the Human Activity Recognition Using Smartphones Dataset version 1.0

The script **run_analysis.R** tidies the data collected from the experiment Human Activity Recognition Using Smartphones Dataset Version 1.0 conducted by Smartlab - Non Linear Complex Systems Laboratory [1].  The data from this experiment is available for download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The **run_analysis.R** script performs the following steps:
1. Download the experiment data from the source URL above.
2. Extract the download file into the **/data** subdirectory of the project.  It creates the **/data** subdirectory if it does not exist.
3. Load the _FIELD/FEATURE_ names from **/data/UCI HAR Dataset/features.txt**.
4. Load the _TRAINING_ data from **/data/UCI HAR Dataset/train** folder using the previously FIELD names.
5. Load the _TEST_ data from **/data/UCI HAR Dataset/test** folder using the previously loaded _FIELD_ names.
6. Merge the _TRAINING_ and _TEST_ data into a single data set.
7. In the merged data set, extract only the measurements for mean and standard deviation for each measurement.
8. Clean up the column names to be more readable in the extracted data set.
9. Transform the _ACTIVITY_ field to use descriptive names as defined in **/data/UCI HAR Dataset/activity_labels.txt**.
10. Save the tidy dataset to **/data/analysis/HAR Dataset - Tidy.csv**
11. Create a second tidy dataset with the average of each variable for ech activity and each subject and save it to **/data/analysis/HAR Dataset - Summarized by Activity and Subject.csv**
12. Save the dataset column names in **/data/analysis/HAR Dataset - Column Names.txt**

## Environment:
- RStudio v1.1.463 - Windows
- R version 3.5.2 (2018-12-20)
- Platform: x86_64-w64-mingw32/x64 (64-bit)
- Running under: Windows >= 8 x64 (build 9200)
- dplyr v0.7.8

## References:
- Original dataset provided by [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
