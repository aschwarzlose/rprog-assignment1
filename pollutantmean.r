directory<-"C:\\Users\\schwaali\\Downloads\\specdata\\specdata"
pollutantmean <- function(directory, pollutant, id=1:332) {
df<-data.frame()
  for (i in id){
  x<-read.csv(paste(directory,"\\",
                                  if(i<10){"00"}else if(i<100){"0"},
                                  i,".csv",sep=""))
  df<-rbind(df,x)
}
  mean(subset(df[[pollutant]],!is.na(df[[pollutant]])))
}           