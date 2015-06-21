if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape")) {
  install.packages("reshape")
}

if (!require("dplyr")) {
  install.packages("dplyr")
}

library(data.table)
library(reshape)
library(dplyr)

# The function downloads the Samsung data and extracts it
download_data <- function () {
  zip.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
  zip.file <- 'dataset.zip'
  
  download.file(zip.url, destfile = zip.file, method = 'curl')
  unzip(zip.file)
}

##################################################################
# 1. Merges the training and the test sets to create one data set.
##################################################################
merge_train_test<-function() {
  # Load and process x_train & x_test data
  x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  x_dataset<-rbind(x_train,x_test)
  
  # Load: data column names and remove duplicates from x_dataset
  features<-read.table("./UCI HAR Dataset/features.txt")
  names(x_dataset)<-features[,2]
  x_dataset <- x_dataset[ !duplicated(names(x_dataset)) ]
  
  # Load and process y_train & y_test data.
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  y_dataset<-rbind(y_train,y_test)
  names(y_dataset)<-c("ActivityId")
  
  # Merge x_dataset and y_dataset
  dataset<-cbind(x_dataset,y_dataset)
  
  # Load and process subjects for training and test data
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_dataset<-rbind(subject_train,subject_test)
  names(subject_dataset)<-c("Subject")
  dataset<-cbind(dataset,subject_dataset)
}

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################
extract_mean_std_variables<-function(dataset) {
  dataset<-select(dataset,Subject,ActivityId,matches("mean\\(\\)|std\\(\\)",ignore.case=TRUE))
}

############################################################################################
# 3. Uses descriptive activity names to name the activities in the data set
############################################################################################
set_activity_names<-function(dataset) {
  activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId","Activity"))
  dataset<-merge(dataset, activity_labels, by="ActivityId")
  dataset<-dataset[,-1]
}

##############################################################
# 4. Appropriately labels the data set with descriptive names.
##############################################################
set_labels<-function(dataset) {
  # Remove parentheses
  names(dataset) <- gsub('\\(|\\)',"",names(dataset), perl = TRUE)
  # Make syntactically valid names
  names(dataset) <- make.names(names(dataset))
  # Make clearer names
  names(dataset) <- gsub('Acc',"Acceleration",names(dataset))
  names(dataset) <- gsub('GyroJerk',"AngularAcceleration",names(dataset))
  names(dataset) <- gsub('Gyro',"AngularSpeed",names(dataset))
  names(dataset) <- gsub('Mag',"Magnitude",names(dataset))
  names(dataset) <- gsub('BodyBody',"Body",names(dataset))
  names(dataset) <- gsub('^t',"TimeDomain.",names(dataset))
  names(dataset) <- gsub('^f',"FrequencyDomain.",names(dataset))
  names(dataset) <- gsub('\\.mean',".Mean",names(dataset))
  names(dataset) <- gsub('\\.std',".StandardDeviation",names(dataset))
  names(dataset) <- gsub('Freq\\.',"Frequency.",names(dataset))
  names(dataset) <- gsub('Freq$',"Frequency",names(dataset))
  dataset
}

######################################################################################################################
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################
create_tidy_dataset<-function(dataset) {
  molten_data <- melt(dataset, id=c("Activity", "Subject"))
  dataset<-cast(molten_data, Activity +  Subject ~ variable, mean)
  #str(dataset)
  write.table(dataset, file = "tidy_dataset.txt", row.name=FALSE)
}

run_analysis<-function(){
  df<-merge_train_test()
  df<-extract_mean_std_variables(df)
  df<-set_activity_names(df)
  df<-set_labels(df)
  create_tidy_dataset(df)
}
