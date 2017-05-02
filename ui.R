
# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  headerPanel("Multi Stock Tool", title = span(
    tagList(icon("line-chart"), "Multi Stock Tool"))),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    width = 2,
    # make a non reactive text input with Update button
    helpText("Yahoo Ticker(s) separated by comma:"),
    createNonReactiveTextInput("symbols", "", value = "SPY,TLT", "Update"),
    br(),
    htmlOutput("status")
  ),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Main", 
               plotOutput("stockPlot"),
               HTML('<table border=0 width="100%"><tr bgcolor="#f5f5f5"><td>'), 
               div(style="width:80%;max-width:300px;",  	   				
                   sliderInput(inputId="dateRange", label=strong('Date Range(# days): '), min=100, max=5000, value=2000, step=100)
               ), HTML('</td><td>'), 
               checkboxInput(inputId="plotReturnsFlag", label=strong('Plot Returns'), value=FALSE),
               HTML('</td></tr></table>'), 
               br(),
               tableOutput("corTable"),
               br(),
               downloadButton("downloadReport", "Download Report"),
               downloadButton("downloadData", "Download Data")
      )  
    )
  )
))
