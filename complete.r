complete <- function(directory, id = 1:332) {
  df<-data.frame()
  for (i in id){
    x<-read.csv(paste(directory,"\\",
                      if(i<10){"00"}else if(i<100){"0"},
                      i,".csv",sep=""))
    df<-rbind(df,x)
  }
  output<-data.frame()
  for(j in unique(df$ID)){
    output<-rbind(output,c(j,nrow(subset(df,!is.na(df$sulfate)&!is.na(df$nitrate)&df$ID==j))))
  }
  colnames(output)<-c("id","nobs")
output
}