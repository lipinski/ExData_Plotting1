# Loading dataset
df = read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE)

# Replacing missing values with NA
df[df == "?"] <- NA

# Changing date column to date objectt
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

# Selecting intresting subset
df_sub = subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Opening divice
png("plot3.png")

# Ploting Energy sub metering
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

# Adding x labels
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

ylabels = c(0, 10, 20, 30)
# Adding x labels
axis(2, at = ylabels, labels = ylabels)

# Adding legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       lwd = 2)

# Closing divice
dev.off()