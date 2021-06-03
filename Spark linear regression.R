exam <- read.csv("E:/Sparks foundation internship/Raw Data.csv", header = T, na.strings = "?")
View(exam)
exam <- na.omit(exam)
fix(exam)
head(exam)
#By spliting the whole dataset in 2 parts
set.seed(123)
ind3 <- sample(2, nrow(exam), replace = T, prob = c(0.8,0.2))
train <- exam[ind3==1, ]  #train dataset
train
test <- exam[ind3==2, ]   #test dataset
test
Result1 <- lm(Scores~Hours, data = train) #Finding coefficients with linear regression
summary(Result1)
plot(train$Hours,train$Scores, main = "Linear Regression", pch = 22, cex = 1) #plotting regression line
abline(Result1)

test["Predicted_Scores"] <- 2.9717+9.6561*test$Hours #creating a new data frame of predicted values
test
predict(Result1, data.frame(Hours = c(1,5,10)), interval = "confidence") #Confidence interval
predict(Result1, data.frame(Hours = c(1,5,10)), interval = "prediction")
Hour <- 9.25
Predicted_Score <- 2.9717+9.6561*Hour
Predicted_Score
