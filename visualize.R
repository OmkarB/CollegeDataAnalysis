visualize = function(data, x_col, y_col, color_col=NULL){
  require(rgl)
  require(shinyRGL)
  source("get_colors.R")
  
  x = data[[x_col]]
  y = data[[y_col]]
  total_length = nrow(data)
  
  # set up color
  if(color_col != "NONE"){
    unique_color_and_values = get_colors(data, color_col)
    unique_color_values = unique_color_and_values[[1]]
    unique_colors = unique_color_and_values[[2]]
    colors = as.character(rep(1, total_length))
    for(i in 1:total_length){
      colors[data[color_col] == unique_color_values[i]] = unique_colors[i]
    }
    #     colors = as.numeric(as.factor(data[[color_col]])) # default colors
  }else{
    colors = "green"
  }
  
  # points
  plot3d(x = data[[x_col]],
         y = data[[y_col]],
         xlab = x_col, ylab = y_col, type="s", size=0.8, col=colors)
  
  # show grids
  grid3d(c("x", "y+"))
}