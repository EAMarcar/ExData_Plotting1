## plot1

## Read the data file

all_pow <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)

## convert Date and Time to a single dat/time variable in proper format


## Subset the file for only 2007-02-01 and 2007-0202

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


## write out the subset so future plots can be built from it

write.table(power, file = "power.txt", row.names=FALSE, col.names=TRUE)

## Open the graphics device where the plot will be sent

png(file = "plot1.png", width = 480, height = 480, type = c("windows")) 


## Crete the first plot - histogram 

hist(power$Global_active_power, col = "red", main = "Global Active Power",
     ylim = range(0 , 1200), 
     xlab = "Global Active Power(kilowatts)")


dev.off()


