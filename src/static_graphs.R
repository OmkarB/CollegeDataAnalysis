data.table <- read.csv(file='C:\\Users\\Omkar\\Documents\\Northeastern\\Fall 15\\CdataCAT.csv',head=TRUE,sep=",")

data.table <- subset(data.table, data.table$md_faminc > 0)

#This should use sapply but doesn't for readability
sub <- subset(data.table, data.table$Sciences > 0.05)
sub1 <- subset(data.table, data.table$Social.Sciences > 0.05)
sub2 <- subset(data.table, data.table$Business > 0.05)
sub3 <- subset(data.table, data.table$Trade > 0.05)
sub4 <- subset(data.table, data.table$Humanities > 0.05)
sub5 <- subset(data.table, data.table$Engineering > 0.05)

x <- sub$md_faminc
sub1_x <- sub1$md_faminc
sub2_x <- sub2$md_faminc
sub3_x <- sub3$md_faminc
sub4_x <- sub4$md_faminc
sub5_x <- sub5$md_faminc


#Trade
plot(sub3_x, sub3$Trade, xlab="Median Income", ylab="Percentage", main= "Trade vs. Income", col="blue")


#Trade
plot(sub5_x, sub5$Business, xlab="Median Income", ylab="Percentage", 
     main= "Business/Engineering vs. Income", col="blue")
points(sub2_x, sub2$Engineering, col='orange')



#Social Sciences
plot(sub1_x, sub1$Social.Sciences, xlab="Median Income", ylab="Percentage", main= "Social Science vs. Income", col="green")
points(sub2_x, sub2$Business, col="blue") 


#
plot(sub4_x, sub4$Humanities, xlab="Median Income", ylab="Percentage", main= "Humanities vs. Income", col="green")
