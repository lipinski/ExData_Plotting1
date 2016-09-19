# Loading dataset
df = read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE)

# Replacing missing values with NA
df[df == "?"] <- NA

# Changing date column to date objectt
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

# Selecting intresting subset
df_sub = subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Opening divice
png("plot4.png")

par(mfrow = c(2, 2))

# Ploting graphs
# Plot 1
plot(
  x = as.numeric(df_sub$Global_active_power), 
  type = "l",
  lty = 1,
  ylab = "Global Active Power (kilowatts)",
  xaxt = "n",
  xlab = ""
)

axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Plot 2
plot(
  x = as.numeric(df_sub$Voltage), 
  type = "l",
  lty = 1,
  ylab = "Voltage",
  xaxt = "n",
  xlab = "datetime"
)

axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Plot 3
plot(
  x = as.numeric(df_sub$Sub_metering_1), 
  type = "l",
  lty = 1,
  ylab = "Energy sub metering",
  xlab = "",
  xaxt = "n",
  yaxt = "n",
  ylim=c(0,40)
)

lines(
  x = as.numeric(df_sub$Sub_metering_2),
  col = "red",
  ylim=c(0,40)
)

lines(
  x = as.numeric(df_sub$Sub_metering_3),
  col = "blue",
  ylim=c(0,40)
)

axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

ylabels = c(0, 10, 20, 30)

axis(2, at = ylabels, labels = ylabels)

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty= c(1, 1, 1),
       lwd= 2,
       bty = "n",
       cex=0.7,
       pt.cex = 1
)

# Plot 4
plot(
  x = as.numeric(df_sub$Global_reactive_power), 
  type = "l",
  lty = 1,
  ylab = "Voltage",
  xaxt = "n",
  xlab = "datetime"
)

axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Closing divice
dev.off()
