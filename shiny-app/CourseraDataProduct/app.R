#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("The Data Products Coursera Inc Shiny project app"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        h1("Introduction"),
        p("This sample app show how-to use Shiny to create interactive applications mixing Html 
          and R code. In this case this app show how-to invoke a prediction function on server,
          for mtcars dataset using HP, WT and AM for predict MPG power and the formula y ~ hp + wt + am."),
        numericInput('hp','Horse Power',100,min=50,max=500),
        numericInput('wt','Car Weight',1.2,min=0.5,max=3.0),
        selectInput('am','Transmission Mode',c("Automatic","Manual")),
        submitButton(text="Get MPG Prediction")
      
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h1("Results"),
         p("In this main panel some results are obtained using a LM regression for mtcars,
           dataset with the formula specified"),
         p("The summary coefficients for preductions are:"),
         tableOutput("summary"),
         p("And the prediction results are:"),
         tableOutput("prediction")
      )
   )
))


library(datasets)
model <- lm(mpg ~ hp + wt + am, data=mtcars)

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {

  output$summary <- renderTable(summary(model)$coefficients)
  react<-reactive({
    am<-ifelse(input$am=="Automatic",yes = 1,no = 0)
    data <- data.frame(hp=input$hp,wt=input$wt,am=am)
  })
  
  output$prediction<-renderText(predict(model,react()))
  
})

# Run the application 
shinyApp(ui = ui, server = server)

