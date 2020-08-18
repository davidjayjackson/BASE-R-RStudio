df <- read.csv("./COVID-19.csv")
df$dateRep <- as.Date(df$dateRep,format="%m-%d-%Y")
US <- subset(df,geoId =="US" & dateRep >="2020-4-01")
str(df)

## Daily Plot of Cases and DEaths
plot(US$dateRep,US$cases,type="b",main="US COVID-19 Cases by Date")
grid(col="black")
plot(US$dateRep,US$deaths,type="l",main="US COVID-19 deaths by Date")
grid(col="black")
## Calc Deaths Rate and plot;
US$Drate <- US$deaths / US$cases *100
plot(US$dateRep,US$Drate,type="l",main = "US Daily Death rate",ylab="Death Percent (%)")
grid(col="black")
##
##  Calculate to date
US$dateRep <- sort(US$dateRep)
US$CUMCases <- cumsum(US$cases)
plot(US$dateRep,US$CUMCases,type="l",main="Total US Case to date")
grid(col="black")

US$CUMDeaths <- cumsum(US$deaths)
plot(US$dateRep,US$CUMDeaths,type="l",main="Total US Deaths to date")
grid(col="black")
