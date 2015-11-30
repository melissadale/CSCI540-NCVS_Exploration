######################################################
###         Machine Learning Approaches
######################################################
library(caret)
IPV.model <- as.factor(IPV) ~ AGE+GENDER+MILITARY+EDUCATION+RACE+SPOUSE_PRESENT+INCOME+
  EMPLOYED_AT_TIME+CHILDREN

#***************Test and Training Data
IPV.Records <- allYears[ which(allYears$IPV == 1),]
Not.IPV <- allYears[ which(allYears$IPV == 0),]

numIPV = nrow(IPV.Records)
numNot = nrow(Not.IPV)
numRecords = numIPV + numNot

#select random sample, using 1/3 as testing and 2/3 as training
#generates a list of random numbers, with the size of 1/3 the sets
#Create random Indexes 
indx <- sample(nrow(allYears), floor((2*nrow(allYears))/3))
trainIPV <- allYears[indx,]
labels.train <- allYears[indx,]$IPV

testIPV <-(allYears[-indx,])
labels.train <- allYears[-indx,]$IPV
######################################################
###         Naive Bayes
######################################################

#Using Cross validation, set up train_control
train_control <- trainControl(method = 'cv', number = 10)
#use naive bayes
model <- train(IPV.model, data = allYears, trControl = train_control, method = 'nb')
model$bestTune
predictions <- predict(model, testIPV)

#check accuracy-K-fold Cross Validation
confusionMatrix(predictions, testIPV$IPV)


######################################################
###         Decision Tree
######################################################
#Using Cross validation, set up train_control
train_control <- trainControl(method = 'cv', number = 10)
#use Decision Tree
model <- train(IPV.model, data = allYears, trControl = train_control, method = 'rpart')
model$bestTune

predictions <- predict(model, testIPV)
#plot
library(rpart.plot)
plot(model$finalModel, margin = 0.2, uniform = TRUE)
text(model$finalModel, use.n = TRUE, cex = .7)
#check accuracy-K-fold Cross Validation
confusionMatrix(predictions, testIPV$IPV)

######################################################
###         K Nearest Neighbors
######################################################
#Using Cross validation, set up train_control
train_control <- trainControl(method = 'cv', number = 10)
#use naive bayes
model <- train(IPV.model, data = allYears, trControl = train_control,
               method = 'knn')
model$bestTune
predictions <- predict(model, testIPV)

#check accuracy-K-fold Cross Validation
confusionMatrix(predictions, testIPV$IPV)
