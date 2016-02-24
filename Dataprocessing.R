library(caret)
data(mtcars)

getTrans <- function(transType){
    if(transType==1) return("Manual")
    else return("Automatic")
}


plotMPG <- function(transmission){
    subset <- mtcars[which(mtcars$am==transmission),]
    chartHeading <-"MPG yield by Number of cylinders for "
    chartHeading <- c(chartHeading, getTrans(transmission), " Transmission")
    plotdata <- boxplot(mpg ~ cyl, data = subset, xlab = "Number of Cylinders", ylab = "Miles per gallon",
                       col = "blue", main = chartHeading)
    plotdata
}

modFit <- train(mpg ~ cyl + am, method="glm", data=mtcars)

predictMPG <- function(transmission, cylinder){
    modFit <- train(mpg ~ am+cyl, method="glm", data=mtcars)
    am <- as.numeric(transmission)
    cyl<-as.numeric(cylinder)

    inputdata <- data.frame(am,cyl)
   mpgValue <- predict(modFit, newdata = inputdata)
    
    return(mpgValue)
}