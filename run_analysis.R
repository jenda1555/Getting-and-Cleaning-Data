#####################################################################################
#####################################################################################
######################### Getting and Cleaning Data - PROJECT #######################

#### LOAD PACKAGES ####
library(data.table)
library(reshape2)

#### LOAD ACTIVITY LABELS ####
activity_labels <- read.table("activity_labels.txt")

#### LOAD FEATURES AND CHOOSE MEAN AND SD####
names_features <- read.table("features.txt")
choose_features <- grep("mean|std", names_features[, 2])

#### LOAD TRAINING SET ####
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#### NAMES AND SUBSTRACTED x_train ####
names(x_train) <- names_features[, 2]
x_train <- x_train[, choose_features]

#### USES ACTIVITY LABELS ####
y_train[,2] <-  activity_labels[y_train[,1], 2]
names(y_train) <-  c("ID", "Label")
names(subject_train) <-  "subject"

#### CREATE TRAIN DATA ####
train_data <- cbind(as.data.frame(subject_train), y_train, x_train)



#### NOW THE SAME PROCEDURE FOR TEST SET ####
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#### NAMES AND SUBSTRACTED x_test ####
names(x_test) <- names_features[, 2]
x_test <- x_test[, choose_features]

#### USES ACTIVITY LABELS ####
y_test[,2] <-  activity_labels[y_test[,1], 2]
names(y_test) <-  c("ID", "Label")
names(subject_test) <-  "subject"

#### CREATE test DATA ####
test_data <- cbind(as.data.frame(subject_test), y_test, x_test)


#### CREATE COMPLETE DATA ####
data <-  rbind(test_data, train_data)

names_labels <-  c("subject", "ID", "Label")
data_labels <- setdiff(colnames(data), names_labels)

#### MELT DATA ####
data <- melt(data, id = names_labels, measure.vars = data_labels)

#### MEAN FOR CREATE TIDY DATA ####
tidy_data <- dcast(data, subject + Label ~ variable, mean)

#### WRITE TIDY DATA AS TXT ####
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)