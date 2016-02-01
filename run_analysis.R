
library(dplyr)
library(tidyr)
## 1 - Read files

filenames <- list.files("UCI HAR Dataset", pattern="*.txt", full.names = TRUE, recursive=TRUE)

features<-read.table("UCI HAR Dataset/features.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")


#for (i in seq_along(filenames)) {
#  name = gsub("[.]txt", "", rev(unlist(strsplit(filenames[i],'/')))[1]);
#  tryCatch(assign(name, read.table(filenames[i])) ,error=function(e){""})
#}

## 1 - Add test indicator to y_test and y_train
y_test <- cbind(test=rep(1,nrow(y_test)),y_test)
y_train <- cbind(test=rep(0,nrow(y_train)),y_train)

## 2 - replace activity numbers with labels
y_merge <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1", all = TRUE)
y_test$activity <- y_merge$V2
y_test$V1 <- NULL

y_merge<-merge(y_train, activity_labels, by.x = "V1", by.y = "V1", all = TRUE)
y_train$activity <- y_merge$V2
y_train$V1<-NULL

## 3 - join test and train files
data <- rbind(X_test, X_train)
y<-rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

## 4 - filter columns to mean and std
columns <- filter(features,grepl('mean[:(:][:):]|std[:(:][:):]',V2))
data <- select(data, columns$V1)

columns$V2 <- gsub("[:(:][:):]","",columns$V2)
names(data) <- t(columns$V2)

## 5 - join y with x files
names(subject) <- "subject"
data <- cbind(subject, y, data)


## 6 - tidy data
data <- gather(data, variable, value, -(subject:activity))

data<-separate(data, variable,c("variable","stat","axis"), sep="-")

data <- unite(data,variable, variable, axis, sep="-")

data$variable<-gsub("-NA","",data$variable)


## 8 - remove temporary objects
rm(list=(ls()[ls()!="data"]))

dmean<-summarize(group_by(data,subject,activity,variable,stat), mean = mean(value))
