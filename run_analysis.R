library(reshape2)
setwd("~/UCI HAR Dataset")

subject_train <- read.table("train/subject_train.txt", header=FALSE, sep="")
subject_test <- read.table("test/subject_test.txt", header=FALSE, sep="")

columnNames <- read.table("./features.txt", header=FALSE, sep="")
columnNames <- as.vector(columnNames$V2, mode = "character")

x_test <- read.table("./test/X_test.txt", header=FALSE, sep="", col.names = columnNames)
x_train <- read.table("./train/X_train.txt", header=FALSE, sep="", col.names = columnNames)

y_train <-read.table("./train/y_train.txt", header=FALSE, sep="")
y_train <- as.vector(y_train$V1)
y_test <-read.table("./test/y_test.txt", header=FALSE, sep="")
y_test <- as.vector(y_test$V1)

x_test <- cbind(x_test, y_test, subject_test)
colnames(x_test)[562]<- "Label"
colnames(x_test)[563]<- "Subject"

x_train <- cbind(x_train, y_train, subject_train)
colnames(x_train)[562]<- "Label"
colnames(x_train)[563]<- "Subject"

dfNames <- c(columnNames, "Activity Label", "Subject")
completeSet <- rbind(x_test, x_train)
colnames(completeSet) <- dfNames

act_labels <- read.table("./activity_labels.txt", header=FALSE, sep="")
colnames(act_labels) <- c("Activity Label", "Activity Name")

SetWLabels <- merge(completeSet, act_labels)
mean_std <- SetWLabels[, grep("mean()|std()|Activity Name|Subject", colnames(SetWLabels))]

mean_std

colnames(mean_std) <- tolower(colnames(mean_std))
colnames(mean_std) <- gsub("-", "", colnames(mean_std))
colnames(mean_std) <- gsub(" ", "", colnames(mean_std))
colnames(mean_std) <- gsub("\\(\\)", "", colnames(mean_std))
reshaped <- mean_std[, grep("mean, colnames(mean_std")]
reshaped <- melt(mean_std, id = c("subject", "activityname"), nar.rm = TRUE, value.var ="mean")
reshaped <- dcast(reshaped, activityname + subject + variable ~ "...", mean)
colnames(reshaped) <- c("activity", "subject", "measurement", "mean")

write.table(reshaped, file="tidyset.txt", sep = " ")

reshaped
