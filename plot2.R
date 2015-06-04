## Exploratory Data Analysis - Class Project 1 
## Jun 4, 2015

## plot2


## Read the data file

all_pow <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)

## convert Date and Time to a single dat/time variable in proper format


## Subset the file for only 2007-02-01 and 2007-02-02

all_pow$F_Date <- as.character(dmy(all_pow$Date))

date1 <- "2007-02-01"   ## begining of range
date2 <- "2007-02-02"   ## end of range

power <- filter(all_pow, F_Date == date1 | F_Date == date2)


## Convert some variables to proper formats

power$DateTime  <- paste(power$Date,power$Time)
power$DateTime <- as.character(strptime(power$DateTime, "%d/%m/%Y %H:%M:%S"))
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)

power$dt2 <- as.POSIXlt(power$DateTime)


## Open a graphics device where the plot will be sent

png(file = "plot2.png", width = 480, height = 480, type = c("windows")) 

## Plot 2

plot(power$dt2, power$Global_active_power, type = "l", main = "", 
     ylab = "Global Active Power (kilowatts)", xlab = " ")

      ## sign the plot (to know it's original with me)
      mtext("<EAM>", side=1, line=4, font=4, adj=1, cex=.75) 

dev.off()

