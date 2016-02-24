library(UsingR)
source("Dataprocessing.R")

shinyServer(  
    function(input, output) {  
        output$trans <- renderPrint({input$trans})
        output$dTable <- renderDataTable(mtcars)
        output$selectedValue <- renderText({paste("You have selected Transmission type: ", getTrans(input$trans))})
        output$selectedCyl <- renderText({paste("Number of cylinders: ",input$cylinder)})
        output$chart <- renderPlot({
            plotMPG(input$trans)
        })
        output$predictedValue <- renderText({
            paste("The predicted miles per gallon for this combination is :",
            predictMPG(input$trans, input$cylinder))
        })
        
   
    }# end of function(input, output)
        
)