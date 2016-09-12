library(dplyr)
library(reshape2)

#Read in data. 
data_train<-read.table(file="./UCI HAR Dataset/train/X_train.txt")
data_test<-read.table(file="./UCI HAR Dataset/test/X_test.txt")
subject_train<-read.table(file="./UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table(file="./UCI HAR Dataset/test/subject_test.txt")
activity_train<-read.table(file="./UCI HAR Dataset/train/y_train.txt")
activity_test<-read.table(file="./UCI HAR Dataset/test/y_test.txt")


#Add activity labels to activity_test
act_names<-c("Walking","Walking Up","Walking Down","Sitting","Standing","Laying")
for (i in seq(along=activity_test$V1)){
  if (activity_test$V1[i] == 1){
    activity_test$act_name[i]<- act_names[1]}
  else if (activity_test$V1[i] == 2){
    activity_test$act_name[i]<- act_names[2]}
  else if (activity_test$V1[i] == 3){
    activity_test$act_name[i]<- act_names[3]}
  else if (activity_test$V1[i] == 4){
    activity_test$act_name[i]<- act_names[4]}
  else if (activity_test$V1[i] == 5){
    activity_test$act_name[i]<- act_names[5]}
  else{
    activity_test$act_name[i]<- act_names[6]}
  }
#Add activity labels to activity_train
for (i in seq(along=activity_train$V1)){
  if (activity_train$V1[i] == 1){
    activity_train$act_name[i]<- act_names[1]}
  else if (activity_train$V1[i] == 2){
    activity_train$act_name[i]<- act_names[2]}
  else if (activity_train$V1[i] == 3){
    activity_train$act_name[i]<- act_names[3]}
  else if (activity_train$V1[i] == 4){
    activity_train$act_name[i]<- act_names[4]}
  else if (activity_train$V1[i] == 5){
    activity_train$act_name[i]<- act_names[5]}
  else{
    activity_train$act_name[i]<- act_names[6]}
}

#remove v1 from activity_train and activity_test so all that remains is the column containing the descriptive activity name
activity_train<-activity_train[,2]; activity_test<-activity_test[,2]

#rename V1 from subject columns to subj
subject_train<-rename(subject_train, subj=V1)
subject_test<-rename(subject_test, subj=V1)

#combine the two big data sets
data<-rbind(data_train, data_test)

#load features.txt and select column indices & names which regard mean and standard deviation
features<-read.table(file="./UCI HAR Dataset/features.txt")
col_indices<-c(grep("mean",features$V2),grep("std",features$V2))
col_names<-c(grep("mean",features$V2,value=TRUE),grep("std",features$V2,value=TRUE))

#Currently the indices from the previous steps are out of order
#Col_indices and col_names are combined into one data frame and then reordered by col_indices
indices_names<-as.data.frame(cbind(col_indices,col_names))
indices_names2<-arrange(indices_names,col_indices)

#Create a single vector for the ordered indices and ordered names for the next step
order_col_indices<-indices_names2[,1]
order_col_names<-as.character(indices_names2[,2])

#Narrow down the data set to only the specific column indices and rename them to their more descriptive names
data2<- data[,order_col_indices]

for (x in seq(along=order_col_indices)){
  names(data2)[x]<-order_col_names[x]
}

#Add activity and subject data to the big data set, which is currently data2
train<-cbind(subject_train, act = activity_train)
test<-cbind(subject_test, act = activity_test)
train_test<-rbind(train,test)
data3<-cbind(train_test,data2)
#order by subject 
data3<-arrange(data3, subj)

#Step 5 of the project instructions
meltedData<- melt(data3, c("subj","act"))
meanData<- dcast(meltedData, subj+act~variable,mean)


