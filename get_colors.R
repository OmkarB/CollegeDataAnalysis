get_colors = function(data, color_col){
  unique_color_values = unique(data[[color_col]])
  unique_colors = rainbow(length(unique_color_values))
  return(list(unique_color_values, unique_colors))
}