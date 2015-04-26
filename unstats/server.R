library(shiny)

source("data.R")

shinyServer(function(input, output) {

    output$countrySelect <- renderUI({
        selectInput("select1", "Select Country", country, selected = NULL, multiple = TRUE)
    })
    
    output$yearSelect <- renderUI({
        if (!is.null(input$select1)) {
            year <- as.integer(unique(data.1[data.1$Country %in% input$select1, 2]))
        }
        
        yMin <- min(year, na.rm = TRUE)
        yMax <- max(year, na.rm = TRUE)
        
        sliderInput("slider1", label = "Select Year", sep = "", min = yMin, 
                    max = yMax, value = c(yMin, yMax), ticks = FALSE, step = 1)
    })
    
    output$sexSelect <- renderUI({
        if (!is.null(input$select1)) {
            sex <- unique(data.1[data.1$Country %in% input$select1, 4])
        }
        
        checkboxGroupInput("group1", label = "Select Sex", sex, selected = sex, inline = TRUE)
    })
    
    output$areaSelect <- renderUI({
        if (!is.null(input$select1)) {
            area <- unique(data.1[data.1$Country %in% input$select1, 3])
        }
        
        checkboxGroupInput("group2", label = "Select Area", area, selected = area, inline = TRUE)
    })
    
    output$plot <- renderPlot({
        if (!is.null(input$select1)) {
            data.2 <- data.1[data.1$Country %in% input$select1 &
                             data.1$Year >= min(input$slider1) & 
                             data.1$Year <= max(input$slider1) &
                             data.1$Sex %in% input$group1 &
                             data.1$Area %in% input$group2,] 
        } else {
            return()            
        }
        
        ggplot(data = data.2, aes(x = Year, y = Population_Count, fill = Sex, alpha = Area))  + 
        geom_area() +  
        scale_fill_manual(values = c('coral4', 'springgreen4')) + 
        scale_alpha_manual(values=c(0.1, 0.5, 1)) + 
        facet_wrap(~Country) + 
        labs(y = "Population", x = "Years") + 
        theme(panel.grid.major = element_blank(),
              panel.background = element_blank())
    })
    
})