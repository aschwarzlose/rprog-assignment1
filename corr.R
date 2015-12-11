corr <- function(directory, threshold = 0) {
  df<-data.frame()
  for (i in 1:332){
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
  
  df2<-subset(df,!is.na(df$sulfate)&!is.na(df$nitrate))
  
  vector<-c()
  for(k in subset(output$id,output$nobs>threshold)){
    vector<-rbind(vector,cor(subset(df2$sulfate,df2$ID==k),subset(df2$nitrate,df2$ID==k)))
  }
  
  vector
}