library(shiny)
library(shinyRGL)

shinyUI(fluidPage(
  
  tags$head(
    tags$style(HTML("
      #plot, #legend {
        float:left;
      }
      
      #legend{
        position:absolute;
        right: 0px;
        top: 120px;
      }

      .tab-content{
        overflow:hidden;
        margin-bottom: 200px;
      }
    "))
  ),
  
  # Application title
  titlePanel("College Major vs. Family Income"),
  
  #Row for selected data source
  sidebarPanel(
    width=4,
    h4("Set up subset"),
    selectInput("col_list", "Choose a category:",
                choices = col.list),
    hr(),
    h4("Set up  display"),
    selectInput("x_axis", 
                choices = data.table$md_faminc),
    selectInput("y_axis", "Choose column for Y axis", 
                choices = col.list, selected=col.list[2])
  ),
  
  #For display data table
  mainPanel(
    width=11,
    tabsetPanel(
      tabPanel("2D Visualization", 
               webGLOutput(outputId="plot", height = 700, width = "100%"), 
               plotOutput(outputId="legend", width = "20%", height="320px")),
      tabPanel("Data Table", dataTableOutput(outputId = "table"))      
    )
  )
  
))

