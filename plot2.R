# Loading dataset
df = read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE)

# Replacing missing values with NA
df[df == "?"] <- NA

# Changing date column to date objectt
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

# Selecting intresting subset
df_sub = subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Opening divice
png("plot2.png")

# Ploting Global Active Power
plot(
  x = as.numeric(df_sub$Global_active_power), 
  type = "l",
  lty = 1,
  ylab = "Global Active Power (kilowatts)",
  xaxt = "n",
  xlab = ""
)

# Adding x labels
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Closing divice
dev.off()