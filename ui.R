# The user-interface definition of the Shiny web app.
library(shiny)
library(dplyr)


shinyUI(pageWithSidebar(
    headerPanel("Motor Trends Car Road Test"),
    sidebarPanel(
        radioButtons("trans", "Select Transmission Type:",
                     c("Manual" = "1",
                       "Automatic" = "0")),
       selectInput('cylinder', 'Number of Cylinders', c("",4,6,8), selected = 4)
        ),
    mainPanel(
        tabsetPanel(
            tabPanel(p(icon("line-chart"), "Visualize the Data"),
            p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).'),
            h3("Predictive Analysis"),
            p('The average mpg for the selected type of transmission and number of cylinders is predicted below'),
            textOutput("selectedValue"),
            textOutput("selectedCyl"),
            textOutput("predictedValue"),
            h3("Exploratory Data Analysis"),
            p('The box plot below indicates average mpg for different cylinder levels for the selected type of transmission.'),
            plotOutput('chart')
            ),
            tabPanel(p(icon("table"), "Dataset"),
                dataTableOutput(outputId="dTable")
            )
        )
    )
    )
)