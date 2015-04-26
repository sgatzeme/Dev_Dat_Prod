library(shiny)

shinyUI(navbarPage("UNStats",
        tabPanel("App",
            pageWithSidebar(
            
                headerPanel("Population by country, sex and area"),
                     
                sidebarPanel(
                    uiOutput("countrySelect"),
                         
                    uiOutput("yearSelect"),
                         
                    uiOutput("sexSelect"),
                         
                    uiOutput("areaSelect")
                ),
                     
                mainPanel(
                    plotOutput("plot")
                )
            )
                 
        ),
        tabPanel("Documentation",
            headerPanel("About the App"),     
            mainPanel(    
                includeMarkdown("data.md")   
            )    
        )
))