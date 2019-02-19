library(dplyr)

sourceFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataPath <- "./data"

# check data directory
if (!file.exists(dataPath))
{
  dir.create(dataPath)
}

# target file name
targetFile <- paste0(dataPath, "/datasets.zip")

# download sourceFile only once
if (!file.exists(targetFile))
{
  message("Downloading ", sourceFile, " to ", targetFile)
  download.file(sourceFile, targetFile)
}

# check if files have been extracted
if (length(dir(dataPath)) <=1)
{
  ## unzip files
  message("Unzipping ", targetFile, " to ", dataPath)
  unzip(targetFile, exdir=dataPath)
}

# load feature names
message("Loading FEATURE names...")
features <- read.delim(paste0(dataPath, "/UCI HAR Dataset/features.txt"), header=FALSE, stringsAsFactors = FALSE, sep=" ", col.names = c("fieldorder", "featurename"))

# load training data
trainPath <- paste0(dataPath,"/UCI HAR Dataset/train")
message("Loading TRAINING data from ", trainPath)
message("Loading TRAINING data X...")
x.train <- read.fwf(paste0(trainPath, "/x_train.txt"), widths=rep(16,561))
message("Loading TRAINING data Y...")
y.train <- read.fwf(paste0(trainPath, "/y_train.txt"), width=5)
message("Loading TRAINING data SUBJECT...")
subject.train <- read.fwf(paste0(trainPath, "/subject_train.txt"), width=5)
data.train <- cbind(subject.train, y.train, x.train)
colnames(data.train) <- c("subject", "activity", features$featurename)

# load test data
testPath <- paste0(dataPath,"/UCI HAR Dataset/test")
message("Loading TEST data from ", testPath)
message("Loading TEST data X...")
x.test <- read.fwf(paste0(testPath, "/x_test.txt"), widths=rep(16,561))
message("Loading TEST data Y...")
y.test <- read.fwf(paste0(testPath, "/y_test.txt"), width=5)
message("Loading TEST data SUBJECT...")
subject.test <- read.fwf(paste0(testPath, "/subject_test.txt"), width=5)
data.test <- cbind(subject.test, y.test, x.test)
colnames(data.test) <- c("subject", "activity", features$featurename)

# merge the training and test data sets
message("Merging data sets")
data <- rbind(data.train,data.test)

#release source data
rm(list=ls(pattern=".train"))
rm(list=ls(pattern=".test"))

#convert data to table
data <- as_tibble(data, .name_repair = "universal")
mydata <- select(data, subject, activity, matches("\\.(mean|std)\\.") )

#release data source
rm("data")


# clean up column names
message("Cleaning up column names...")
names(mydata) <- gsub("\\.\\.", "", gsub("\\.\\.\\.", ".", names(mydata)))

colnames <- names(mydata)
colnames <- gsub("Gravity", "Gravity ", colnames)
colnames <- gsub("Acc", "Acceleration ", colnames)
colnames <- gsub("Jerk", "Jerk ", colnames)
colnames <- gsub("Mag", "Magnitude ", colnames)
colnames <- gsub("Gyro", "Gyro ", colnames)
colnames <- gsub("Body", "Body ", colnames)
colnames <- gsub(".mean.", "- Mean() - ", colnames)
colnames <- gsub(".std.", "- STD() - ", colnames)
colnames <- gsub(".mean", "- Mean()", colnames)
colnames <- gsub(".std", "- STD()", colnames)
names(mydata) <- colnames

# change activity to actual names
message("Updating activity names...")
mydata <- mutate(mydata, activity=factor(mydata$activity, levels=1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")))

# summarize per activity / subject
message("Summarizing by activity and subject...")
summaryByActivitySubject <- group_by(mydata, activity, subject) %>% summarize_all(mean)

# save to file
analysisPath <- paste0(dataPath, "/analysis")
# check analysis directory
if (!file.exists(analysisPath))
{
  dir.create(analysisPath)
}

message("Saving analysis data to directory ", analysisPath )
write.csv(mydata, paste0(analysisPath, "/HAR Dataset-Tidy.csv"))
write.csv(summaryByActivitySubject, paste0(analysisPath, "/HAR Dataset-Summarized by Activity and Subject.csv"))