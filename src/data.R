import_data = function(){
  
  data.table <- read.csv(file='C:\\Users\\Omkar\\Documents\\Northeastern\\Fall 15\\CdataCAT.csv',head=TRUE,sep=",")
  
  #This should use sapply but doesn't for readability
  #Values have been filtered 
  sub <- subset(data.table, data.table$Sciences > 0.1)
  sub1 <- subset(data.table, data.table$Social.Sciences > 0.1)
  sub2 <- subset(data.table, data.table$Business > 0.1)
  sub3 <- subset(data.table, data.table$Trade > 0.1)
  sub4 <- subset(data.table, data.table$Humanities > 0.1)
  sub5 <- subset(data.table, data.table$Engineering > 0.1)

  x <- sub$md_faminc
  sub1_x <- sub1$md_faminc
  sub2_x <- sub2$md_faminc
  sub3_x <- sub3$md_faminc
  sub4_x <- sub4$md_faminc
  sub5_x <- sub5$md_faminc
       
}  