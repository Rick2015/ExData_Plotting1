# Assuming in directory with unzipped "exdata-data-household_power_consumption" folder 
# that contains "household_power_consumption.txt" file

# Used Notepad++ as in "Getting And Cleaning Data" Course
# Determined starting row and ending rows for 1/02/2007 and 2/02/2007

hpc <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings="?", skip=66636, nrow=2880)

hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2), mar=c(5,5,2,1))
plot(hpc$Time, hpc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
plot(hpc$Time, hpc$Voltage, type = "l", ylab="Voltage", xlab="datetime")
plot(hpc$Time, hpc$Sub_metering_1, col="black", type= "l", ylab="Energy sub metering", xlab="")
lines(hpc$Time, hpc$Sub_metering_2, col="red")
lines(hpc$Time, hpc$Sub_metering_3, col="blue")
legend("topright", bty="n", cex=0.95, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$Time, hpc$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")
dev.off()