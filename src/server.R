library(shiny)
library(rgl)
library(shinyRGL)

shinyServer(function(input, output) {
  
  #Filter data based on selections
  data.display.reactive = reactive({
    result = filter_data(input, data.display)
    return result
  })
  
  data.visual.reactive = reactive({
    result = filter_data(input, data.visual)
    return result
  })
  
  output$table <- renderDataTable(data.display.reactive())
  output$plot <- renderWGL({
    display_data = data.visual.reactive(){
      #Creates the actual plot
      visualize(display_data, x_col=input$x_axis, y_col=input$y_axis, 
                color_col=input$color_col)
    }
  })

  output$legend <- renderPlot({
    display_data = data.visual.reactive()
    unique_color_and_values = get_colors(display_data, input$color_col)
    values = unique_color_and_values[1]
    colors = unique_color_and_values[2]
    plot(1, type='n', ylim = c(0,0), xlim = c(0,0), axis = FALSE, ann=FALSE)
    par(oma=c(0,0,0))
    for(i in 1:length(values)){
      points(x=i, y=i, col="white")
    }
    legend(x="left", values, col = colors, pch=19, cex=1.2)
  })
  
})
